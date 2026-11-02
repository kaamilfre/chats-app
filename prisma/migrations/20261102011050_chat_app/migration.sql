/*
  Warnings:

  - You are about to drop the `app` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `comments` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "app";

-- DropTable
DROP TABLE "comments";

-- CreateTable
CREATE TABLE "chats" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "profile" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'User'
);

-- CreateIndex
CREATE UNIQUE INDEX "chats_id_key" ON "chats"("id");
