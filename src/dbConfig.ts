import * as dotenv from 'dotenv'

dotenv.config()

const { user, host, password, database, dbport: port } = process.env

const config = { user, host, password, database, port: parseInt(port) }

export default config 
