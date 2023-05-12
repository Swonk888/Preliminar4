import { Logger } from '../common'
const sql = require('mssql')

const sqlConfig = {
    user: "root",
    password: "123456",
    database: "caso3",
    server: "localhost",
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
}

export class data_caso2 {
    private log: Logger;

    public constructor()
    {
        this.log = new Logger();
    }

    public async getVentasbyFilterNoPool(filter: number): Promise<any> {
        const connection = await sql.connect(sqlConfig);
        try {
            await connection.connect();
            const result = await connection.request()
            .input('ContratoID', sql.Int, filter)
            .execute('getFilteredVentas');
            return result.recordset;
        } catch (error) {
            console.error(error);
            throw error;
        } finally {
            await connection.close();
        }
        }
}


