Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B9A8EAE6
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Aug 2019 13:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbfHOL6x (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 15 Aug 2019 07:58:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42070 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfHOL6x (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Aug 2019 07:58:53 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hyEP0-0007rQ-Rv; Thu, 15 Aug 2019 11:58:46 +0000
From:   Colin King <colin.king@canonical.com>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Stefan Popa <stefan.popa@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iio: dac: ad5380: fix incorrect assignment to val
Date:   Thu, 15 Aug 2019 12:58:46 +0100
Message-Id: <20190815115846.21800-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the pointer val is being incorrectly incremented
instead of the value pointed to by val. Fix this by adding
in the missing * indirection operator.

Addresses-Coverity: ("Unused value")
Fixes: c03f2c536818 ("staging:iio:dac: Add AD5380 driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/dac/ad5380.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad5380.c b/drivers/iio/dac/ad5380.c
index 4335214800d2..2ebe08326048 100644
--- a/drivers/iio/dac/ad5380.c
+++ b/drivers/iio/dac/ad5380.c
@@ -220,7 +220,7 @@ static int ad5380_read_raw(struct iio_dev *indio_dev,
 		if (ret)
 			return ret;
 		*val >>= chan->scan_type.shift;
-		val -= (1 << chan->scan_type.realbits) / 2;
+		*val -= (1 << chan->scan_type.realbits) / 2;
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
 		*val = 2 * st->vref;
-- 
2.20.1

