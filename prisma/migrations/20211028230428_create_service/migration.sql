-- CreateEnum
CREATE TYPE "services_day_of_the_week" AS ENUM ('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday');

-- CreateTable
CREATE TABLE "services" (
    "id" TEXT NOT NULL,
    "day_of_the_week" "services_day_of_the_week" NOT NULL,
    "opening_time" TIMESTAMP(3) NOT NULL,
    "closing_time" TIMESTAMP(3) NOT NULL,
    "openned" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "services_pkey" PRIMARY KEY ("id")
);
