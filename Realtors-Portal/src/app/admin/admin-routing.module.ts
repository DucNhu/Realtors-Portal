import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminComponent } from './admin.component';
import { NotfoundComponent } from '../@theme/notfound/notfound.component';
const routes: Routes = [
    {
        path: '', component: AdminComponent
    },
    {
        path: '**', component: NotfoundComponent
    }
]
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class AdminRoutingModule { }