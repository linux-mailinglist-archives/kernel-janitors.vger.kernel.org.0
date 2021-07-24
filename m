Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971ED3D4821
	for <lists+kernel-janitors@lfdr.de>; Sat, 24 Jul 2021 16:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhGXNsS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 24 Jul 2021 09:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhGXNrT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 24 Jul 2021 09:47:19 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6621EC061575
        for <kernel-janitors@vger.kernel.org>; Sat, 24 Jul 2021 07:27:47 -0700 (PDT)
Received: from ipservice-092-217-090-214.092.217.pools.vodafone-ip.de ([92.217.90.214] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <postmaster@kaiser.cx>)
        id 1m7Icl-0002yQ-Ds; Sat, 24 Jul 2021 16:27:31 +0200
Received: from martin by martin-debian-2.paytec.ch with local (Exim 4.92)
        (envelope-from <martin@martin-debian-2.paytec.ch>)
        id 1m7Ick-0006H2-Vx; Sat, 24 Jul 2021 16:27:31 +0200
Date:   Sat, 24 Jul 2021 16:27:30 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Add a check in of_get_nand_secure_regions()
Message-ID: <20210724142712.GA24036@martin-debian-1.paytec.ch>
References: <YMtQFXE0F1w7mUh+@mwanda>
 <20210715225045.66185-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715225045.66185-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: "Martin Kaiser,,," <martin@martin-debian-2.paytec.ch>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi all,

Thus wrote Miquel Raynal (miquel.raynal@bootlin.com):

> On Thu, 2021-06-17 at 13:37:25 UTC, Dan Carpenter wrote:
> > Check for whether of_property_count_elems_of_size() returns a negative
> > error code.

> > Fixes: 13b89768275d ("mtd: rawnand: Add support for secure regions in NAND memory")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

I'm running linux-next on an imx25 system with the following flash chip

[    1.997539] nand: device found, Manufacturer ID: 0x98, Chip ID: 0xaa
[    2.004134] nand: Toshiba NAND 256MiB 1,8V 8-bit
[    2.008917] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128

The system is using the drivers/mtd/nand/raw/mxc_nand.c driver.

Since this commit appeared in linux-next, mxc_nand's probe function fails
with -EINVAL, taking this path

mxcnd_probe
   nand_scan
      nand_scan_with_ids
         nand_scan_tail
            of_get_nand_secure_regions

nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
returns -EINVAL as there's no secure-regions property in my device tree.

We should certainly handle negative error codes before we calculate
chip->nr_secure_regions = nr_elem / 2
but a missing secure-regions property is a valid case and should not make
the probe fail.

If the property exists, but the device-tree entry is incorrect
and of_property_count_elems_of_size returns -ENODATA, we might print a
warning and ignore the entry.

What do you think?

Thanks,

   Martin
