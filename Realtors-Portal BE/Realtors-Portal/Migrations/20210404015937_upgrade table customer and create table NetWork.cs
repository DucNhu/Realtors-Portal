using Microsoft.EntityFrameworkCore.Migrations;

namespace Realtors_Portal.Migrations
{
    public partial class upgradetablecustomerandcreatetableNetWork : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Active",
                table: "Seller");

            migrationBuilder.DropColumn(
                name: "Avatar",
                table: "Seller");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Seller");

            migrationBuilder.DropColumn(
                name: "Password",
                table: "Seller");

            migrationBuilder.DropColumn(
                name: "Phone",
                table: "Seller");

            migrationBuilder.DropColumn(
                name: "User_type",
                table: "Seller");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Agent");

            migrationBuilder.DropColumn(
                name: "Password",
                table: "Agent");

            migrationBuilder.RenameColumn(
                name: "Address",
                table: "User",
                newName: "Title");

            migrationBuilder.RenameColumn(
                name: "ppID",
                table: "Seller",
                newName: "UserID");

            migrationBuilder.RenameColumn(
                name: "ProductID",
                table: "Seller",
                newName: "AgentID");

            migrationBuilder.RenameColumn(
                name: "PackageID",
                table: "Seller",
                newName: "ActiveAgent");

            migrationBuilder.RenameColumn(
                name: "Name",
                table: "Agent",
                newName: "NameAgent");

            migrationBuilder.AddColumn<int>(
                name: "AreID",
                table: "User",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "CityID",
                table: "User",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "CountryID",
                table: "User",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "User",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DistrictID",
                table: "User",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "LocationID",
                table: "User",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "NetWorkID",
                table: "User",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SellerID",
                table: "Agent",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "UserID",
                table: "Agent",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AreID",
                table: "User");

            migrationBuilder.DropColumn(
                name: "CityID",
                table: "User");

            migrationBuilder.DropColumn(
                name: "CountryID",
                table: "User");

            migrationBuilder.DropColumn(
                name: "Description",
                table: "User");

            migrationBuilder.DropColumn(
                name: "DistrictID",
                table: "User");

            migrationBuilder.DropColumn(
                name: "LocationID",
                table: "User");

            migrationBuilder.DropColumn(
                name: "NetWorkID",
                table: "User");

            migrationBuilder.DropColumn(
                name: "SellerID",
                table: "Agent");

            migrationBuilder.DropColumn(
                name: "UserID",
                table: "Agent");

            migrationBuilder.RenameColumn(
                name: "Title",
                table: "User",
                newName: "Address");

            migrationBuilder.RenameColumn(
                name: "UserID",
                table: "Seller",
                newName: "ppID");

            migrationBuilder.RenameColumn(
                name: "AgentID",
                table: "Seller",
                newName: "ProductID");

            migrationBuilder.RenameColumn(
                name: "ActiveAgent",
                table: "Seller",
                newName: "PackageID");

            migrationBuilder.RenameColumn(
                name: "NameAgent",
                table: "Agent",
                newName: "Name");

            migrationBuilder.AddColumn<int>(
                name: "Active",
                table: "Seller",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Avatar",
                table: "Seller",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Seller",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Password",
                table: "Seller",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Phone",
                table: "Seller",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "User_type",
                table: "Seller",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Agent",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Password",
                table: "Agent",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
