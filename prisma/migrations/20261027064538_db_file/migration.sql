-- CreateTable
CREATE TABLE "db" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "age" INTEGER,
    "email" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "db_email_key" ON "db"("email");
