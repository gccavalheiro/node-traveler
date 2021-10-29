-- CreateTable
CREATE TABLE "services_locations" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "location_id" TEXT NOT NULL,
    "service_id" TEXT NOT NULL,

    CONSTRAINT "services_locations_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "services_locations" ADD CONSTRAINT "services_locations_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "locations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "services_locations" ADD CONSTRAINT "services_locations_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "services"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
