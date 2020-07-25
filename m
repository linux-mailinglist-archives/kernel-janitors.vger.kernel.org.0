Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75FAE22D603
	for <lists+kernel-janitors@lfdr.de>; Sat, 25 Jul 2020 10:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgGYITF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 25 Jul 2020 04:19:05 -0400
Received: from lithops.sigma-star.at ([195.201.40.130]:36774 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGYITF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Jul 2020 04:19:05 -0400
X-Greylist: delayed 348 seconds by postgrey-1.27 at vger.kernel.org; Sat, 25 Jul 2020 04:19:04 EDT
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id F303D6071A74;
        Sat, 25 Jul 2020 10:13:14 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id mmZdptfRQbs3; Sat, 25 Jul 2020 10:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id EC4D26071A7C;
        Sat, 25 Jul 2020 10:13:12 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 7pjzFcqw8NDv; Sat, 25 Jul 2020 10:13:12 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id C40136071A74;
        Sat, 25 Jul 2020 10:13:12 +0200 (CEST)
Date:   Sat, 25 Jul 2020 10:13:12 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Message-ID: <265316380.171213.1595664792652.JavaMail.zimbra@nod.at>
In-Reply-To: <20200725063701.GA1058480@kroah.com>
References: <20200725063416.172037-1-weiyongjun1@huawei.com> <20200725063701.GA1058480@kroah.com>
Subject: Re: [PATCH -next] mtd: fix missing unlock on error in
 mtdchar_compat_ioctl()
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: fix missing unlock on error in mtdchar_compat_ioctl()
Thread-Index: unRYG1XOaa/d55A4orlZmW/yp+6gkg==
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

----- Ursprüngliche Mail -----
> Von: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
> An: "Wei Yongjun" <weiyongjun1@huawei.com>
> CC: "Miquel Raynal" <miquel.raynal@bootlin.com>, "richard" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>,
> "linux-mtd" <linux-mtd@lists.infradead.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "kernel-janitors"
> <kernel-janitors@vger.kernel.org>, "Hulk Robot" <hulkci@huawei.com>
> Gesendet: Samstag, 25. Juli 2020 08:37:01
> Betreff: Re: [PATCH -next] mtd: fix missing unlock on error in mtdchar_compat_ioctl()
> I think Richard already resolved this in his tree, but I could be wrong.

Yes, fixed in git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
and should be visible in linux-next very soon.
 
> And nice detection by your bot, that's good to see.

Yeah, good to see that such issues are being detected automatically.

Thanks,
//richard
