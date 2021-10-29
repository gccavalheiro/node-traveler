-- CreateTable
CREATE TABLE "locations_category" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "location_id" TEXT NOT NULL,
    "category_id" TEXT NOT NULL,

    CONSTRAINT "locations_category_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "locations_category" ADD CONSTRAINT "locations_category_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "locations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "locations_category" ADD CONSTRAINT "locations_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
