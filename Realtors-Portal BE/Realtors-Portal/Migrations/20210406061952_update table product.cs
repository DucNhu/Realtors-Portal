using Microsoft.EntityFrameworkCore.Migrations;

namespace Realtors_Portal.Migrations
{
    public partial class updatetableproduct : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "SellerID",
                table: "project",
                newName: "UserID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "UserID",
                table: "project",
                newName: "SellerID");
        }
    }
}
