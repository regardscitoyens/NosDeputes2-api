import * as mysql from 'mysql2'
import { Kysely, MysqlDialect, Generated } from 'kysely'
import { DB_PWD } from './conf'

export function getDb() {
  console.log('Starting DB connection pool')
  return new Kysely<NosDeputesDatabase>({
    dialect: new MysqlDialect({
      pool: mysql.createPool({
        host: 'localhost',
        user: 'manu',
        password: DB_PWD,
        database: 'nosdeputes',
      }),
    }),
  })
}

interface NosDeputesDatabase {
  parlementaire: ParlementaireTable
}

interface ParlementaireTable {
  id: Generated<number>
  nom: string
  nom_de_famille: string
  sexe: 'H' | 'F'
  date_naissance: Date
  num_circo: Date
  nom_circo: Date
  sites_web: 'string' | null
  debut_mandat: Date
  fin_mandat: Date | null
  place_hemicycle: number
  url_an: string
  profession: string | null
  id_an: number
  groupe_acronyme: string
  adresses: string
  suppleant_de_id: number | null
  anciens_mandats: string
  mails: string
  collaborateurs: string
  top: string
  villes: string | null
  url_ancien_cpc: string | null
  created_at: Date
  updated_at: Date
  slug: string
}
