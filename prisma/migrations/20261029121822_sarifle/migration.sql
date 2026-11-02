/*
  Warnings:

  - You are about to drop the `db` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "db";

-- CreateTable
CREATE TABLE "sarifle" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" INTEGER NOT NULL,
    "invite" INTEGER,
    "Created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateIndex
CREATE UNIQUE INDEX "sarifle_email_key" ON "sarifle"("email");
