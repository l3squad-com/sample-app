import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { LoginController } from './login/login.controller';
import { DashboardController } from './dashboard/dashboard.controller';

@Module({
  imports: [],
  controllers: [AppController, LoginController, DashboardController],
  providers: [AppService],
})
export class AppModule {}
