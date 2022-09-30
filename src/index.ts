import * as dotenv from 'dotenv'
import express, { Request, Response } from 'express'
import { getDb } from './db'
dotenv.config()

function startServer() {
  const db = getDb()

  const app = express()
  const port = 4545

  app.get('/', (req: Request, res: Response) => {
    res.json('Hello !')
  })

  app.get('/v0.1/parlementaire', async (req: Request, res: Response) => {
    const parlementaires = await db
      .selectFrom('parlementaire')
      .selectAll()
      .execute()
    res.json(parlementaires)
  })

  app.listen(port, () => {
    console.log(`Server is running at https://localhost:${port}`)
  })
}

startServer()
