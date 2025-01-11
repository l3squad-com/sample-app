import { Controller, Get } from '@nestjs/common';

@Controller('dashboard')
export class DashboardController {
  @Get()
  getDashboardPage() {
    return { message: 'Dashboard page endpoint' };
  }
}
