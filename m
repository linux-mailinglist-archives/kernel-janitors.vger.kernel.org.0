Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72AAF60A98
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jul 2019 18:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbfGEQnb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Jul 2019 12:43:31 -0400
Received: from mout.web.de ([212.227.15.4]:58067 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728130AbfGEQna (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Jul 2019 12:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1562344999;
        bh=gD157kdCsRqOnqsAB+UXQk3341dxQKj7LmDDpN7udqI=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=WfgH9AbPl0yZfyd17TuxnPG5elsy6odCzr0gHv8l0WankCl78cD4EShjHekjhIQ3U
         ZwM6tiyx1yzVQuCpdv0usWgr1YUZsAIhMG8qidJrU3EQSlZG4ieMBqexoE8SLQQklm
         O3GTxCiyk9ElYB09KHb/NZ6Cn4z4MYdxg39UQoRw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.45.164]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LxqwW-1idY7n01KO-015KnC; Fri, 05
 Jul 2019 18:43:19 +0200
To:     Andrew Morton <akpm@linux-foundation.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] xtensa: One function call less in bootmem_init()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <495c9f2e-7880-ee9a-5c61-eee598bb24c2@web.de>
Date:   Fri, 5 Jul 2019 18:43:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+zub2k6RKCsXK2JmNwjqpAW5tpMvbhXINb2cVeLMEt1Ho/Rx72a
 3MqSLO6561yHu7s5eP77x1uoVAKZ2VjwUFSB/eQdIyIzDzekGgCkl5be7oDan88IOL/NUth
 CfMBxUJ4xphTEldVlk4n8v4wAYox/lQhyE9jVAACyGVtwDODupDKqNegsNgaQDEUfqJU2Dq
 kRZA6fsnzRgVrTFxLWuDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qvd2u8c5tSs=:McbIBM1Mjqs32tsoM0OZMm
 xfalvoUpwaQYc53gza51eWugwyGOK6HtJvJwt0gDhhr0piiddMhioZ47R3V4g5ko/teyVUg5z
 flSzqHFiAtsMVlc/yclw1ZPlzoYtuLffpcn4e1MErHPDHU9+ncxhw2Q2l4k47/zuapFnXrM6c
 Q9d2Ix9jLF6hkfqZ+hjVCddjRiIFMGktfHgU+C6sLqWQdZ3LSfzHIR4emqPtPu50K8yZv4v08
 3GNWe6KR6m74/MmF9B8DbLESqKQn1TkGEM1mZ92wqY5X8TSsCkZMqFyC1QfTmUN45rHzNDdo9
 2S0i2zfd1i1PimY+z+LtX15s+4mmFKt+/+j3wOt9CPtlLkQaD2fcJ+tIUe3rna25k0b5Z/26M
 BXMEHYWo4lUKdfE23X8n93rDxrf6kvWFUH4K6m7y8PIA6zNaraWl1B5GvCA0JUOj0L4LsarBj
 Wt/uSNGpnZDIi6mKx4o7K1SVvE7zY+0Tj6nqy/+DcjKrj8DkbpkoIlXkof9lEmyHWRKhsqYoo
 0zj0oBMV2OkMChLPomXMy+FNaM9fNhiAQ+yMTZbQCf4DCAEwXW3fLsvxGJl467eBTnQ6WVwlq
 zWwmu/s+rH6Cn3kY5ZEseLM1giTp9OuiUaC3WaOlp39s6hF9GKyEeIE1YsY62hcpLXYlpMbA5
 Era+J1qID3FYx/WzutmeO1PfMx3brWwUTNCWg2PiOz4rNO3YtVQwDswb8pDbypwIv754vnmsz
 7ygcdyeOnUMalNhnk6wrvlxNbkE7PzbuCzTnjfS0mG/Q1MM5vOLFX7plQgH/mrxakbCR/ZWbS
 ebl2Y5fdslryAp/+pcQaMebcXPmgRwYBtU9IInGHoflL00q2WyeTSCKhcI/TWrdcR6x/H2Je2
 TcYJd7xj6tXXcc0I3O0hpIgAR40/htFIYYo/u11nJDLXUNCCpz09eh1aWnAh9YTJhLby1OMsf
 4MGPG652/t951pVXOBuOrER6tJ6o8GJDmY9vYqgt+2+R9getuiPxpg1TLSmHwPaNgXmhkTU65
 6btcO44Xa5pnvTlG6W2JLrRsFTcA4oebi9BF+0lEySSaz3K0gIp8p575vqYTa6ovehBREY6ki
 exY1iRtD5OrLWA/DOodbEGTaw4dLWVCfQaX
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jul 2019 18:33:58 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement for a setting selection.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/xtensa/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index b51746f2b80b..79467c749416 100644
=2D-- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -45,10 +45,7 @@ void __init bootmem_init(void)
 	 * If PHYS_OFFSET is zero reserve page at address 0:
 	 * successfull allocations should never return NULL.
 	 */
-	if (PHYS_OFFSET)
-		memblock_reserve(0, PHYS_OFFSET);
-	else
-		memblock_reserve(0, 1);
+	memblock_reserve(0, PHYS_OFFSET ? PHYS_OFFSET : 1);

 	early_init_fdt_scan_reserved_mem();

=2D-
2.22.0

