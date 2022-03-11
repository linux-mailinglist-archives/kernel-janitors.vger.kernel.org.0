Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6CC4D5C55
	for <lists+kernel-janitors@lfdr.de>; Fri, 11 Mar 2022 08:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347288AbiCKHdW (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 11 Mar 2022 02:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346937AbiCKHcz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Mar 2022 02:32:55 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38911B6E26;
        Thu, 10 Mar 2022 23:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1646983906;
        bh=GQUZaq6GsSJojbgXCQh0Wb7X4eTeX57F0lrmek8KsaM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=eGDnypdw4O6d+Pe1RbHYSha4zeahI2WCAcfBbJUdXWUzFD5Z1R35NdK+WCaID9pYm
         u3ZtAFyS2i/IzrMFARG4iMJegln0hJHkhXG47sesjQtDW5UHL13OHDDFOT2eROh6df
         y+iR76O+rK1YnDp6nkTidrYfnShMDjJepPeIF1ck=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.134.231]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1nLdjF3EGx-00GGma; Fri, 11
 Mar 2022 08:31:46 +0100
Message-ID: <a8107fc3-2d89-eaa1-bde6-2d1e848147fd@gmx.de>
Date:   Fri, 11 Mar 2022 08:30:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] video: fbdev: kyro: make read-only array ODValues static
 const
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220308202328.104043-1-colin.i.king@gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220308202328.104043-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LV03ComVuUBR0jQamp6N+pGB6nOG8fFeSy/QHFJ67dkesRx7BQW
 gXkt+g309PmX0PAtl8P7vkPRKPZ1PKyZaz9Ii4Zlrf/lNpzWJO2E4eVHk4g0/PdfiX6aY4r
 i8b2gwNuxE2FcWOvmFzxj5AwOTo9H7EqSpKGctEGAogdMvPWIYHLM10dEESVHm86CCvK4Vl
 bZDwL5JJCx/rBXDNPaWHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ux0xeDo+OFw=:6QIoOuFQiOxD7cagm8Ew+6
 oSVdr+CEduW41n8cUgg/0/DZxLd5Nq73K4hJDWNP46CV98cljF07s3CcGseb5lfHflKquaopR
 Cicfng+kUaVlzxJsbuZj86Xw0DE763LPUr+84ZMFoTfeFcqL+16yBIbFWGNAZWGbSgP5cnJ/V
 pzyUsRJ+TeLAjsWB37SiYf0Ht0Qfoqa6LmqAhuLB2esxhEVnLKQYvddBAokW/Y7iHBu8KGn++
 E1YZP25zCuGxnD2yfkq7/uahuz2Al5F2KTkl0UkI3v7KbPG+JfMRsgYV6u9owPhfcGYQHrKxS
 WdiFxgA5NamDPrF4H7UHXZjx7CMrRQt4DbyUOBjDIcsXr/zee3ibDKDsFFRfn4ooxFBFwt1D7
 tWP9aQmHDZ7A4nWIm3vVaN7hpBNIUuW2AYbglOGhnIQPo82gcGhfWQoxP/ibK3DHpI/ldxrzm
 uCQj51ThCQNTmL/lBASb6+qlcqgv0jPFOFfbt8eBGvDL4cAtGvSEBazru+Qh4kC6a+AiNjga+
 CrsZjPqgnzCpntXEk42bRZYp3ELx8+eR0YTX30DeTPw0wcIO4D0RhUCU9Y2A3gBbTBwGoAC5f
 7SefA9y6muV9yy/td+Gss9F1SBlx/zwcSj9KhbakmEgWYikkIPtqqCcSKQuCQu1jN4T74z/UD
 QGY4TsYEBHrcLt+Mq/1y3/uCbLMPqJNiKJKV2STBhMRiGL19Jm1JArh3HLN0K0HQ+dwNZnbWh
 u5qvXrzGVkS5cQ/AWFWhZBwbCXddKvFN8NoR4KaEUi7NLjAyCvVvCVOd0c3yP/ndbdUqM1xDB
 dBaheBmOdQyYcOrfx8in8Eo5isHZJlHTO+J3yOm+0O41wGYXgqP1hE1BYs5y41eWmJllvQ38J
 vdZBuSuNXGOLU5NUS19wqoE9vfGBAVMOP+C16V1+Vtq6W9ztJ/0HL5nb8KkGBSoKSVAkN0QoS
 +sPYOQPXnceAA9b9dROVhWawiYX0CaGZXQ39dWjU9LH9ZTGC895nUQMIbkJ6IAHTv6fV77OuQ
 4Mv+vY+4dAESqWLw7IP+pedoSr3/VfFz7IF+6K40HgCdkEWVOW8ULpVbEeGrsGsc25YNx9CDY
 lWyVqypDlI42mU=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/8/22 21:23, Colin Ian King wrote:
> Don't populate the read-only array ODValues on the stack but
> instead make it static const. Also makes the object code a little
> smaller.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> ---
>  drivers/video/fbdev/kyro/STG4000InitDevice.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/kyro/STG4000InitDevice.c b/drivers/vide=
o/fbdev/kyro/STG4000InitDevice.c
> index 21875d3c2dc2..ffeb355c8b50 100644
> --- a/drivers/video/fbdev/kyro/STG4000InitDevice.c
> +++ b/drivers/video/fbdev/kyro/STG4000InitDevice.c
> @@ -124,7 +124,7 @@ u32 ProgramClock(u32 refClock,
>  	u32 ulScore, ulPhaseScore, ulVcoScore;
>  	u32 ulTmp =3D 0, ulVCO;
>  	u32 ulScaleClockReq, ulMinClock, ulMaxClock;
> -	u32 ODValues[] =3D { 1, 2, 0 };
> +	static const u32 ODValues[] =3D { 1, 2, 0 };

applied, but I made this:
	static const unsigned char

Thanks!
Helge

>
>  	/* Translate clock in Hz */
>  	coreClock *=3D 100;	/* in Hz */

