-- CreateTable
CREATE TABLE "ebyan" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "ebyan_id_key" ON "ebyan"("id");
