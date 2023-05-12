import { Logger } from '../common'
import { data_caso2 } from '../repositories/data_caso2';

export class CasoController2 {
    private static instance: CasoController2;
    private log: Logger;

    private constructor()
    {
        this.log = new Logger();
        try
        {
        } catch (e)
        {
            this.log.error(e);
        }
    }

    public static getInstance() : CasoController2
    {
        if (!this.instance)
        {
            this.instance = new CasoController2();
        }
        return this.instance;
    }

    public getFilteredVentas2(filtered:number) : Promise<any> 
    {
        const infos = new data_caso2();
        return infos.getVentasbyFilterNoPool(filtered);
    }
}