import { Injectable } from '@nestjs/common';
import { Cart, CartItem } from '../models';
import { Client, ClientConfig } from 'pg'
import config from '../../dbConfig'

const client = new Client(config)
client.connect()

@Injectable()
export class CartService {

  async findByUserId(userId: string): Promise<Cart> {
    if (!userId) userId = 'ac3e2b40-8cdb-4393-a641-5a63f36f1b94'

    const { rows } = await client.query(
      `
          select 
          c.user_id,
          c.id as cart_id,
          c_i.count,
          p.id as product_id,
          p.title,
          p.price,
          p.description
          from cart_items c_i
          join products p 
          on (c_i.product_id=p.id)
          join carts c
          on (c.id=c_i.cart_id)
          where c.user_id='${userId}'
       `
    )

    const userCart: Cart = rows.reduce((cart: Cart, row) => {
      const item: CartItem = {
        count: row.count,
        product: {
          title: row.title,
          price: row.price,
          description: row.description,
          id: row.product_id
        }
      }
      return {
        id: row.cart_id,
        items: cart.items?.length > 0 ? [...cart.items, item] : [item]
      }
    }, {})

    return userCart;
  }

  async createByUserId(userId: string): Promise<Cart> {
    const q = `
      insert into carts (updated_id, user_id)
      values (${new Date()}, ${userId})
    `
    return await this.findByUserId(userId)

  }

  async findOrCreateByUserId(userId: string): Promise<Cart> {
    const userCart = await this.findByUserId(userId);

    if (userCart) {
      return userCart;
    }

    return this.createByUserId(userId);
  }

  async updateByUserId(userId: string, body: Cart): Promise<Cart> {
    const { id, ...rest } = await this.findOrCreateByUserId(userId);

    const values = body.items
      .map((item: CartItem) => `('${id}', '${item.product.id}', '${item.count}')`)
      .join()

    const q = `
        delete from cart_items ci
        where ci.cart_id = '${id}';
        insert into cart_items(cart_id, product_id, count)
        values ${values};
      `
    await client.query(q)

    const updatedCart = await this.findByUserId(userId)

    return updatedCart

  }

  async removeByUserId(userId): Promise<void> {
    const { id } = await this.findByUserId(userId)
    const q = `
        delete from cart_items ci
        where ci.cart_id = '${id}';
    `
    await client.query(q)
  }
}
