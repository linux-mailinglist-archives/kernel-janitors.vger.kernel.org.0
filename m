Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA1DA6049A
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jul 2019 12:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbfGEKgd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Jul 2019 06:36:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:45080 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728132AbfGEKgd (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Jul 2019 06:36:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 373DCAC4E;
        Fri,  5 Jul 2019 10:36:32 +0000 (UTC)
Date:   Fri, 05 Jul 2019 12:36:31 +0200
Message-ID: <s5hbly8zs28.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     wharms@bfs.de
Cc:     "Colin King" <colin.king@canonical.com>,
        <alsa-devel@alsa-project.org>, "Jaroslav Kysela" <perex@perex.cz>,
        <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: cs4281: remove redundant assignment to variable val and remove a goto
In-Reply-To: <5D1F245A.7030203@bfs.de>
References: <20190705095704.26050-1-colin.king@canonical.com>
        <5D1F245A.7030203@bfs.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 05 Jul 2019 12:20:10 +0200,
walter harms wrote:
> 
> 
> 
> Am 05.07.2019 11:57, schrieb Colin King:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The variable val is being assigned with a value that is never
> > read and it is being updated later with a new value. The
> > assignment is redundant and can be removed.  Also remove a
> > goto statement and a label and replace with a break statement.
> > 
> > Addresses-Coverity: ("Unused value")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  sound/pci/cs4281.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
> > index a2cce3ecda6f..04c712647853 100644
> > --- a/sound/pci/cs4281.c
> > +++ b/sound/pci/cs4281.c
> > @@ -694,7 +694,7 @@ static int snd_cs4281_trigger(struct snd_pcm_substream *substream, int cmd)
> >  
> >  static unsigned int snd_cs4281_rate(unsigned int rate, unsigned int *real_rate)
> >  {
> > -	unsigned int val = ~0;
> > +	unsigned int val;
> >  	
> >  	if (real_rate)
> >  		*real_rate = rate;
> > @@ -707,9 +707,8 @@ static unsigned int snd_cs4281_rate(unsigned int rate, unsigned int *real_rate)
> >  	case 44100:	return 1;
> >  	case 48000:	return 0;
> >  	default:
> > -		goto __variable;
> > +		break;
> >  	}
> > -      __variable:
> >  	val = 1536000 / rate;
> >  	if (real_rate)
> >  		*real_rate = 1536000 / val;
> 		^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> this is confusing. is
> *real_rate = rate
> intended here ? (like above)
> 
> val could be eliminated by using
> 
> return  1536000 / rate ;

No, the current code is correct.
The purpose of this calculation is to consider the truncation by
division.


Takashi
