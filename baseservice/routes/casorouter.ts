import * as express from 'express';
import { Logger } from '../common'
import { CasoController } from '../controllers'

const app = express();
const log = new Logger();

app.post("/showcontractdata", (req, res,next) => {
    CasoController.getInstance().getFilteredVentas(req.body.filter)
    .then((data: any)=>{
        res.json(data);
    })
    .catch((err: any)=>{
        log.error(err);
        return "{msg: \"error\"}";
    });

});

export { app as casorouter };