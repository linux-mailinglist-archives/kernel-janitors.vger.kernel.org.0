Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C30FD010A
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Oct 2019 21:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbfJHTPL (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 8 Oct 2019 15:15:11 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44723 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbfJHTPL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Oct 2019 15:15:11 -0400
Received: by mail-qt1-f194.google.com with SMTP id u40so26888283qth.11
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Oct 2019 12:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=dxAtTWPQp4TAeXr8xO4IQ/pBkwmVo6wQB+eXQ6x/TLY=;
        b=Dfe+1jeovnFdBVweXsJvOp5BXdxpHw9080gV/0Umo0I2a24FNdmFyl1kiPo4ge+iFa
         XSOQDtE+tqvSG2aazcK/svPTXJbhuIQ1OJ4yekFUkLJCTRR1tySDi5nDjqHuM0NfHc9t
         9jgXyZjdo4nmS8oyHaNOZB7JqN19UiGyG5HPs6wy6+Va5I3J9EynqE3QjgjVSADyXVQG
         /hjCL+IcFA8R6EGs+CdTjpe6rumTcwilrCVAhumrpaLOlv+F/W6Sd4SVNdweiUEpPFCa
         4utVrLXKeyetZXfxbGmeV6XZ7j9PTyjs9yBvdWDJ+YiY7FaHy2jIErDoC9kKpsVo5lF8
         G9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=dxAtTWPQp4TAeXr8xO4IQ/pBkwmVo6wQB+eXQ6x/TLY=;
        b=L3rQUwjw1S8tX6KqZuq6SMPmz9PYG0Uo6sWZCBJ7E/lRfGPZKHLm4E2K41cBPeERuK
         bXKp/IPHM+ht8JfVOgFeyWRyOfKWFCUuF121GALx72pHxFH1b+i4zDGSySfmszeSM/VX
         7kbhVUmHE9EvnGqPc7zavufHQKzATVI8LxTCDlNvAg+U1b5XPujCJv2+3JD0rIWAIaw3
         x/ymxMYpac0kQCOSUJldacZ5EncxmK1Dql+2VFa/sHpgiGQF3t1TKD87u5/JF1FVBzHM
         3lbMOLfVVFL5S0eYdFSXoORLWZbyag3sCcMm/3je6Flnh4FCLR+GIT22nktV5mxHjto4
         kT5w==
X-Gm-Message-State: APjAAAXwgpvj14GF1cM29/hislrqXDMQOMwdw6Khr0sSpc+37tg5Dv6r
        V7vfYl+bfV8OgSAMJeR5+Ekhng==
X-Google-Smtp-Source: APXvYqzS0pTRdoYgQCvIqtrfKJbCdPzqZle2A/oqLtOkZCOi7IR/U1Hy7/FKxRoxWdHyuUsA3VINxw==
X-Received: by 2002:a0c:a988:: with SMTP id a8mr7939928qvb.34.1570562110549;
        Tue, 08 Oct 2019 12:15:10 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id f21sm8763054qkl.51.2019.10.08.12.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 12:15:10 -0700 (PDT)
Date:   Tue, 8 Oct 2019 12:14:57 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Colin King <colin.king@canonical.com>
Cc:     "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] netdevsim: fix spelling mistake "forbidded" ->
 "forbid"
Message-ID: <20191008121457.34b570be@cakuba.netronome.com>
In-Reply-To: <alpine.LFD.2.21.1910080921350.25653@eddie.linux-mips.org>
References: <20191008081747.19431-1-colin.king@canonical.com>
        <alpine.LFD.2.21.1910080921350.25653@eddie.linux-mips.org>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 8 Oct 2019 09:29:58 +0100 (BST), Maciej W. Rozycki wrote:
> On Tue, 8 Oct 2019, Colin King wrote:
> 
> > diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
> > index a3d7d39f231a..ff6ced5487b6 100644
> > --- a/drivers/net/netdevsim/dev.c
> > +++ b/drivers/net/netdevsim/dev.c
> > @@ -486,7 +486,7 @@ static int nsim_dev_reload_down(struct devlink *devlink, bool netns_change,
> >  		/* For testing purposes, user set debugfs dont_allow_reload
> >  		 * value to true. So forbid it.
> >  		 */
> > -		NL_SET_ERR_MSG_MOD(extack, "User forbidded reload for testing purposes");
> > +		NL_SET_ERR_MSG_MOD(extack, "User forbid the reload for testing purposes");  
> 
>  If nitpicking about grammar, then FWIW I believe it should actually be:
> 
> 		NL_SET_ERR_MSG_MOD(extack, "User forbade the reload for testing purposes");
> 
> (and then:
> 
> 		NL_SET_ERR_MSG_MOD(extack, "User set up the reload to fail for testing purposes");
> 
> elsewhere).

So I consulted with someone vaguely British, and they said they'd use
"forbid" here, therefore I've applied the patch to net-next.
