using Microsoft.EntityFrameworkCore.Migrations;

namespace Realtors_Portal.Migrations
{
    public partial class updateUserAddress : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "LocationID",
                table: "User",
                newName: "Location");

            migrationBuilder.RenameColumn(
                name: "DistrictID",
                table: "User",
                newName: "District");

            migrationBuilder.RenameColumn(
                name: "CountryID",
                table: "User",
                newName: "Country");

            migrationBuilder.RenameColumn(
                name: "CityID",
                table: "User",
                newName: "City");

            migrationBuilder.RenameColumn(
                name: "AreID",
                table: "User",
                newName: "Are");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Location",
                table: "User",
                newName: "LocationID");

            migrationBuilder.RenameColumn(
                name: "District",
                table: "User",
                newName: "DistrictID");

            migrationBuilder.RenameColumn(
                name: "Country",
                table: "User",
                newName: "CountryID");

            migrationBuilder.RenameColumn(
                name: "City",
                table: "User",
                newName: "CityID");

            migrationBuilder.RenameColumn(
                name: "Are",
                table: "User",
                newName: "AreID");
        }
    }
}
