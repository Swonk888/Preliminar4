import { Logger } from '../common'
const sql = require('mssql')

const sqlConfig = {
    user: "root",
    password: "123456",
    database: "caso3",
    server: "localhost",
    pool:{
        max: 5,
        min: 5,
        idleTimeoutMillis : 30000
    },
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
}

export class data_caso {
    private log: Logger;

    public constructor()
    {
        this.log = new Logger();
    }

    public getVentasbyFilter(filter:number) : Promise<any>
    {
        return sql.connect(sqlConfig).then((pool:any) =>{
            return pool.request()
            .input('ContratoID', sql.Int, filter)
            .execute('showContractData')
            .then((result:any) => {
                console.log(result)
                return result.recordset;
            });
        });
    }
}
