Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADFA53C748
	for <lists+kernel-janitors@lfdr.de>; Tue, 11 Jun 2019 11:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404449AbfFKJf3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 11 Jun 2019 05:35:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:41094 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404137AbfFKJf2 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jun 2019 05:35:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 82CEEAF57;
        Tue, 11 Jun 2019 09:35:27 +0000 (UTC)
Date:   Tue, 11 Jun 2019 11:35:26 +0200
Message-ID: <s5hd0jkbh29.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     "Thomas Gleixner" <tglx@linutronix.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "KateStewart" <kstewart@linuxfoundation.org>,
        "AllisonRandal" <allison@lohutok.net>,
        "Jaroslav Kysela" <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] ALSA: lx6464es - Remove set but not used variables 'orun_mask, urun_mask'
In-Reply-To: <20190601041214.99366-1-yuehaibing@huawei.com>
References: <20190601041214.99366-1-yuehaibing@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 01 Jun 2019 06:12:14 +0200,
YueHaibing wrote:
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> sound/pci/lx6464es/lx_core.c: In function 'lx_interrupt_handle_async_events':
> sound/pci/lx6464es/lx_core.c:990:6: warning:
>  variable 'urun_mask' set but not used [-Wunused-but-set-variable]
> sound/pci/lx6464es/lx_core.c:989:6: warning:
>  variable 'orun_mask' set but not used [-Wunused-but-set-variable]
> 
> They are never used, so can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.


Takashi
