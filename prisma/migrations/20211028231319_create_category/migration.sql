-- CreateEnum
CREATE TYPE "category_location" AS ENUM ('spots_touristic', 'food_and_drink', 'events_organized');

-- CreateTable
CREATE TABLE "categories" (
    "id" TEXT NOT NULL,
    "name" "category_location" NOT NULL,
    "icon" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);
