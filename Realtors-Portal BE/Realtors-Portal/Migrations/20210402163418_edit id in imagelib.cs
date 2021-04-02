using Microsoft.EntityFrameworkCore.Migrations;

namespace Realtors_Portal.Migrations
{
    public partial class editidinimagelib : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ImageID",
                table: "ImageLib",
                newName: "ImageLibID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ImageLibID",
                table: "ImageLib",
                newName: "ImageID");
        }
    }
}
