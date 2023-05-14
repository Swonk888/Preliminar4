import * as express from 'express';
import { Logger } from '../common'
import { CasoController2 } from '../controllers'

const app = express();
const log = new Logger();

app.post("/showcontractdata2", (req, res,next) => {
    CasoController2.getInstance().getFilteredVentas2(req.body.filter)
    .then((data: any)=>{
        res.json(data);
    })
    .catch((err: any)=>{
        log.error(err);
        return "{msg: \"error\"}";
    });

});

export { app as casorouter2 };