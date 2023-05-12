import * as express from 'express';
import * as bodyParser from 'body-parser';
import { Logger } from '../common';
import { casorouter } from './casorouter';
import { casorouter2 } from './casorouter2';

class Routes {

    public express: express.Application;
    public logger: Logger;

    constructor() {
        this.express = express();
        this.logger = new Logger();

        this.middleware();
        this.routes();
    }

    // Configure Express middleware.
    private middleware(): void {
        this.express.use(bodyParser.json());
        this.express.use(bodyParser.urlencoded({ extended: false }));
    }

    private routes(): void {
        this.express.use('/caso', casorouter);
        this.express.use('/caso2', casorouter2);
        this.logger.info("caso route loaded");
        this.logger.info("caso2 route loaded");
    }
}

export default new Routes().express;

