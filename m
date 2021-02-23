Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17994322A87
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Feb 2021 13:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbhBWMaz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 23 Feb 2021 07:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbhBWMax (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Feb 2021 07:30:53 -0500
X-Greylist: delayed 67353 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 Feb 2021 04:30:13 PST
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5A9B7C06174A;
        Tue, 23 Feb 2021 04:30:13 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 5359992009C; Tue, 23 Feb 2021 13:30:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 514DE92009B;
        Tue, 23 Feb 2021 13:30:10 +0100 (CET)
Date:   Tue, 23 Feb 2021 13:30:10 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>,
        linux-edac@vger.kernel.org, linux-hams@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] arch: mips: remove dead references
In-Reply-To: <CAAdtpL7tj2CvK9w8PNofu1C6Do0gojwWgupJmB_XEYto+EEf3A@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2102231326440.1900@angie.orcam.me.uk>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com> <20210222161905.1153-5-lukas.bulwahn@gmail.com> <CAAdtpL7tj2CvK9w8PNofu1C6Do0gojwWgupJmB_XEYto+EEf3A@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 23 Feb 2021, Philippe Mathieu-Daudé wrote:

> On Mon, Feb 22, 2021 at 5:22 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > The domain lookup for linux-mips.org fails for quite some time now.
> > Further, the two links:
> >
> >   http://decstation.unix-ag.org/
> 
> https://web.archive.org/web/20070609185805/http://decstation.unix-ag.org/
> 
> >   http://www.computer-refuge.org/classiccmp/ftp.digital.com/pub/DEC/TriAdd/

ftp://ftp.hp.com/pub/alphaserver/archive/triadd/

(which is essentially the primary source back up)

  Maciej
