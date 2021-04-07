import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AgentGuard } from './@core/_helpers/agent.guard';
import { AuthGuard } from './@core/_helpers/auth.guard';
import { SellerGuard } from './@core/_helpers/seller.guard';
import { LoginComponent } from './@theme/login/login.component';
import { NotfoundComponent } from './@theme/notfound/notfound.component';
const routes: Routes = [
    {
        canActivate: [AuthGuard],
        path: 'admin', loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule)
    },
    {
        canActivate: [AuthGuard],
        path: 'adminadmin', loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule)
    },
    {
        path: '', loadChildren: () => import('./page/page.module').then(m => m.PageModule)
    },
    {
        path: 'Home', loadChildren: () => import('./page/page.module').then(m => m.PageModule)
    },
    {
        canActivate: [SellerGuard],
        path: 'profile-seller', loadChildren: () => import('./customer/seller/seller.module').then(m => m.SellerModule)
    },
    {
        canActivate: [AgentGuard],
        path: 'profile-agent', loadChildren: () => import('./customer/agent/agent.module').then(m => m.AgentModule)
    },
    
    {
        path: "**", component: NotfoundComponent
    }
];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule { }
