import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from '../..//@core/_helpers/auth.guard';
import { LoginComponent } from '../../@theme/login/login.component';
import { NotfoundComponent } from '../../@theme/notfound/notfound.component';
import { AgentComponent } from './agent.component';
import { ProductComponent } from './controll/product/product.component';
const routes: Routes = [
    {
        path: '', component: AgentComponent,
        children: [
            {
                path: '', component: ProductComponent
            },
            {
                path: 'product', component: ProductComponent
            }
        ]
    },
    {
        path: "**", component: NotfoundComponent
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule { }
