Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF4C133B48
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Jan 2020 06:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgAHFi3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Jan 2020 00:38:29 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:50460 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgAHFi3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jan 2020 00:38:29 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0085TWaA082176;
        Wed, 8 Jan 2020 05:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=6yMY9tCUW+Zz3vJLeZlb0YXm9NayUfaLZuZW64OoMlo=;
 b=hOkYN8eWa/48COhJMrpIBVha8j5ZX3fSaF4lgvH+h5qFsP1VNHWMVNLt7lLUTP4HMgxU
 Dy2K61ciPeDIpkONf55XhOyGOVBthnR43k+rgXpuWcWbdph9FHXogngtVAlYbQ2vhWh1
 SyhiAaq+91jJ/t+Nma2qDi4MrV7jRIXC7JvuU8uwQud8JjJwfCKo1YTYFonuaD8vzEbH
 T3HHKYusRnnoLXDW5VswS1L4Zbd5WjJtrhmdIbzVHahjyphdNGoXWmO21Ub29aV8edES
 /OwJ9f6VHc8CQuqrK8DsOr40bsFsOWr4qv7h9q6zznwNvMrka6fgJfwZn3hBWkKi7yyK Yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2xakbqsk1u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Jan 2020 05:37:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0085Xojf187905;
        Wed, 8 Jan 2020 05:37:31 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2xcqbk90vf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Jan 2020 05:37:31 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0085bEQ3011993;
        Wed, 8 Jan 2020 05:37:18 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Jan 2020 21:37:13 -0800
Date:   Wed, 8 Jan 2020 08:37:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc:     Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Allison Randal <allison@lohutok.net>,
        Kirill Smelkov <kirr@nexedi.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: control: potential uninitialized return value
Message-ID: <20200108053706.h3hcnvmnf62wkjac@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=971
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001080048
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001080048
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that "ret" might be uninitialized.

Fixes: fbd3eb7f66c5 ("ALSA: control: Add verification for kctl accesses")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index d06033d418a8..aa0c0cf182af 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -896,7 +896,7 @@ static int sanity_check_elem_value(struct snd_card *card,
 				   u32 pattern)
 {
 	size_t offset;
-	int i, ret;
+	int i, ret = 0;
 	u32 *p;
 
 	switch (info->type) {
-- 
2.11.0

