import { Logger } from '../common'
import { data_caso } from '../repositories/data_caso';

export class CasoController {
    private static instance: CasoController;
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

    public static getInstance() : CasoController
    {
        if (!this.instance)
        {
            this.instance = new CasoController();
        }
        return this.instance;
    }

    public getFilteredVentas(filtered:number) : Promise<any> 
    {
        const infos = new data_caso();
        return infos.getVentasbyFilter(filtered);
    }
}