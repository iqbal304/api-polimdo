-- CreateTable
CREATE TABLE `Jurusan` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_jurusan` VARCHAR(191) NOT NULL,
    `ketua_jurusan` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Prodi` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_prodi` VARCHAR(191) NOT NULL,
    `ketua_prodi` VARCHAR(191) NOT NULL,
    `jurusanId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `kode` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `no_telp` VARCHAR(191) NOT NULL,
    `jurusanId` INTEGER NOT NULL,
    `prodiId` INTEGER NOT NULL,

    UNIQUE INDEX `User_kode_key`(`kode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Skema` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL,
    `kategori` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Kegiatan` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `judul` VARCHAR(191) NOT NULL,
    `kategori` VARCHAR(191) NOT NULL,
    `abstrak` TEXT NOT NULL,
    `skemaId` INTEGER NOT NULL,
    `ketuaId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `KegiatanAnggota` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `kegiatanId` INTEGER NOT NULL,
    `peran` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Prodi` ADD CONSTRAINT `Prodi_jurusanId_fkey` FOREIGN KEY (`jurusanId`) REFERENCES `Jurusan`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_jurusanId_fkey` FOREIGN KEY (`jurusanId`) REFERENCES `Jurusan`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_prodiId_fkey` FOREIGN KEY (`prodiId`) REFERENCES `Prodi`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Kegiatan` ADD CONSTRAINT `Kegiatan_skemaId_fkey` FOREIGN KEY (`skemaId`) REFERENCES `Skema`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Kegiatan` ADD CONSTRAINT `Kegiatan_ketuaId_fkey` FOREIGN KEY (`ketuaId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `KegiatanAnggota` ADD CONSTRAINT `KegiatanAnggota_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `KegiatanAnggota` ADD CONSTRAINT `KegiatanAnggota_kegiatanId_fkey` FOREIGN KEY (`kegiatanId`) REFERENCES `Kegiatan`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
