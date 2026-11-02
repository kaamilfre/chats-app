/*
  Warnings:

  - You are about to drop the column `comment` on the `app` table. All the data in the column will be lost.
  - You are about to drop the `ebyan` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `product_name` on table `app` required. This step will fail if there are existing NULL values in that column.
  - Made the column `url_image` on table `app` required. This step will fail if there are existing NULL values in that column.

*/
-- CreateEnum
CREATE TYPE "Role" AS ENUM ('Admin', 'User');

-- AlterTable
ALTER TABLE "app" DROP COLUMN "comment",
ADD COLUMN     "role" "Role" NOT NULL DEFAULT 'User',
ALTER COLUMN "product_name" SET NOT NULL,
ALTER COLUMN "url_image" SET NOT NULL;

-- DropTable
DROP TABLE "ebyan";

-- CreateTable
CREATE TABLE "comments" (
    "id" SERIAL NOT NULL,
    "comment" TEXT
);

-- CreateIndex
CREATE UNIQUE INDEX "comments_id_key" ON "comments"("id");
