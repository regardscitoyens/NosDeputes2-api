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
    res.json(await db.selectFrom('parlementaire').selectAll().execute())
  })

  app.get('/v0.1/parlementaire/:slug', async (req: Request, res: Response) => {
    const slug = req.params.slug
    res.json(
      await db
        .selectFrom('parlementaire')
        .where('slug', '=', slug)
        .selectAll()
        .executeTakeFirstOrThrow(),
    )
  })

  app.get(
    '/v0.1/parlementaire/:slug/organisme',
    async (req: Request, res: Response) => {
      const slug = req.params.slug
      const { id: deputeId } = await db
        .selectFrom('parlementaire')
        .select('id')
        .where('slug', '=', slug)
        .executeTakeFirstOrThrow()
      res.json(
        await db
          .selectFrom('parlementaire_organisme')
          .where('parlementaire_id', '=', deputeId)
          .selectAll()
          .execute(),
      )
    },
  )

  app.get('/v0.1/organisme', async (req: Request, res: Response) => {
    res.json(await db.selectFrom('organisme').selectAll().execute())
  })

  app.get('/v0.1/organisme/:id', async (req: Request, res: Response) => {
    const id = parseInt(req.params.id, 10)
    res.json(
      await db
        .selectFrom('organisme')
        .where('id', '=', id)
        .selectAll()
        .executeTakeFirstOrThrow(),
    )
  })

  app.listen(port, () => {
    console.log(`Server is running at https://localhost:${port}`)
  })
}

startServer()
