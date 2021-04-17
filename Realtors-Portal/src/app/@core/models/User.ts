import { Role } from "./Role";

export class User {
    id: number;
    username: string;
    password: string;
    
    role: Role;
    token?: string;
    Infor: {
        ID: number,
        PackageID: number;
        User_type: string;
        Email: string
    }
}

