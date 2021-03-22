using Microsoft.EntityFrameworkCore.Migrations;

namespace Realtors_Portal.Migrations
{
    public partial class upupercasemodels : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "title",
                table: "project",
                newName: "Title");

            migrationBuilder.RenameColumn(
                name: "levelActive",
                table: "project",
                newName: "LevelActive");

            migrationBuilder.RenameColumn(
                name: "description",
                table: "project",
                newName: "Description");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Title",
                table: "project",
                newName: "title");

            migrationBuilder.RenameColumn(
                name: "LevelActive",
                table: "project",
                newName: "levelActive");

            migrationBuilder.RenameColumn(
                name: "Description",
                table: "project",
                newName: "description");
        }
    }
}
