import { Injectable } from '@nestjs/common';

import { v4 } from 'uuid';

import { Cart, CartItem } from '../models';

import { Client } from 'pg'

import config from '../../dbConfig'

const client = new Client(config)

client.connect()

@Injectable()
export class CartService {
  private userCarts: Record<string, Cart> = {};

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

    console.log(rows)
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
        id: row.id,
        items: cart.items?.length > 0 ? [...cart.items, item] : [item]
      }
    }, {})

    return userCart;
  }

  createByUserId(userId: string) {
    const id = v4(v4());
    const userCart = {
      id,
      items: [],
    };

    this.userCarts[userId] = userCart;

    return userCart;
  }

  async findOrCreateByUserId(userId: string): Promise<Cart> {
    const userCart = await this.findByUserId(userId);

    if (userCart) {
      return userCart;
    }

    return this.createByUserId(userId);
  }

  async updateByUserId(userId: string, { items }: Cart): Promise<Cart> {
    const { id, ...rest } = await this.findOrCreateByUserId(userId);

    const updatedCart = {
      id,
      ...rest,
      items: [...items],
    }

    this.userCarts[userId] = { ...updatedCart };

    return { ...updatedCart };
  }

  removeByUserId(userId): void {
    this.userCarts[userId] = null;
  }

}
