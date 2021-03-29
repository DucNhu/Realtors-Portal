using Microsoft.EntityFrameworkCore.Migrations;

namespace Realtors_Portal.Migrations
{
    public partial class Addingpackage : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "active",
                table: "Location",
                newName: "Active");

            migrationBuilder.RenameColumn(
                name: "active",
                table: "District",
                newName: "Active");

            migrationBuilder.RenameColumn(
                name: "active",
                table: "Country",
                newName: "Active");

            migrationBuilder.RenameColumn(
                name: "active",
                table: "City",
                newName: "Active");

            migrationBuilder.RenameColumn(
                name: "active",
                table: "Category",
                newName: "Active");

            migrationBuilder.RenameColumn(
                name: "active",
                table: "Are",
                newName: "Active");

            migrationBuilder.CreateTable(
                name: "Package",
                columns: table => new
                {
                    PackageID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PackageName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Price = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    PromotionPrice = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    PackageTitle = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PackageDesciption = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NumberOfAds = table.Column<int>(type: "int", nullable: false),
                    PackageAvatar = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Duration = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Package", x => x.PackageID);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Package");

            migrationBuilder.RenameColumn(
                name: "Active",
                table: "Location",
                newName: "active");

            migrationBuilder.RenameColumn(
                name: "Active",
                table: "District",
                newName: "active");

            migrationBuilder.RenameColumn(
                name: "Active",
                table: "Country",
                newName: "active");

            migrationBuilder.RenameColumn(
                name: "Active",
                table: "City",
                newName: "active");

            migrationBuilder.RenameColumn(
                name: "Active",
                table: "Category",
                newName: "active");

            migrationBuilder.RenameColumn(
                name: "Active",
                table: "Are",
                newName: "active");
        }
    }
}
