Return-Path: <kernel-janitors+bounces-563-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E386803448
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Dec 2023 14:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 404E21C20AAD
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Dec 2023 13:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1316024B2F;
	Mon,  4 Dec 2023 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V3Cqwlbs"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E35F8F40;
	Mon,  4 Dec 2023 13:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAE7C433C7;
	Mon,  4 Dec 2023 13:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701695880;
	bh=ZqsFtctKz9KtHBVaOAU2TTpWyjElrfSFoJLOxIVMTBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3CqwlbsqEox3O49weyGdcQgKaT/vva39nClwrr0CpCRY2g3pjXHrIasnDELtAzg+
	 sAb05PUuBlSLobzbT5w2mwA4s5YNFxoxQ29uJ5QK7wKqXw6ck98VVV94DcMJcBcp4m
	 saMkFkQUWPsmS1A7nJ5Fb28oF86lN5vZ2FitGqKA=
Date: Mon, 4 Dec 2023 22:17:58 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Su Hui <suhui@nfschina.com>, alexander.usyskin@intel.com,
	tomas.winkler@intel.com, arnd@arndb.de, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] misc: mei: client.c: fix problem of return
 '-EOVERFLOW' in mei_cl_write
Message-ID: <2023120425-broaden-image-fdc9@gregkh>
References: <20231128014507.418254-1-suhui@nfschina.com>
 <2023120452-stool-party-bf2b@gregkh>
 <bd13cda0-6437-40fa-a73a-9770be6f0167@suswa.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd13cda0-6437-40fa-a73a-9770be6f0167@suswa.mountain>

On Mon, Dec 04, 2023 at 04:11:31PM +0300, Dan Carpenter wrote:
> On Mon, Dec 04, 2023 at 09:00:42AM +0100, Greg KH wrote:
> > > diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> > > index 7ea80779a0e2..0489bec4fded 100644
> > > --- a/drivers/misc/mei/client.c
> > > +++ b/drivers/misc/mei/client.c
> > > @@ -2033,7 +2033,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
> > >  	hbuf_slots = mei_hbuf_empty_slots(dev);
> > >  	if (hbuf_slots < 0) {
> > >  		rets = -EOVERFLOW;
> > > -		goto out;
> > > +		goto err;
> > 
> > Please prove that this is correct, as based on the code logic, it seems
> > very wrong.  I can't take this unless the code is tested properly.
> 
> Hi Greg,
> 
> When Su Hui sent the v2 patch you sent an auto response about adding
> stable to the CC list.
> https://lore.kernel.org/all/2023112042-napped-snoring-b766@gregkh/
> 
> However, it appears that you still applied the v2 patch.  It's in
> linux-next as commit ee6236027218 ("misc: mei: client.c: fix problem of
> return '-EOVERFLOW' in mei_cl_write").
> 
> When I use `git am` to apply this patch, then it doesn't apply.  However,
> when I use cat email.txt | patch -p1 then it tries to reverse the patch
> and apply it to a different function.

Odd, I missed that I had already applied the first one, nevermind, that
one is correct, this one was wrong :)

thanks,

greg k-h

