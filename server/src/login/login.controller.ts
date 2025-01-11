import { Controller, Get } from '@nestjs/common';

@Controller('login')
export class LoginController {
  @Get()
  getLoginPage() {
    return { message: 'Login page endpoint' };
  }
}
