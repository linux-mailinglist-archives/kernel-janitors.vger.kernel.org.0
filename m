Return-Path: <kernel-janitors+bounces-2705-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4318AEB51
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Apr 2024 17:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFC4A2867B6
	for <lists+kernel-janitors@lfdr.de>; Tue, 23 Apr 2024 15:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA1813C9D9;
	Tue, 23 Apr 2024 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NQSopt2y"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9689F13C827
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 15:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713886916; cv=none; b=F7IIdlMMDUVJ40X3LjQuIXmBOSYmZGpTKoEvnL3gKTD+JFl1KUxM+VemzV4vBlI5tSpwOoBiVaoY/LCQXgkr+4ClPukwY5ITgy+hBs+VbBCkUIdqOmskJ9jRXdK33Nwrc2TTGFf21fH/aVuc9sMqD1WGqwJXvPB3RrHefIpvsVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713886916; c=relaxed/simple;
	bh=JPvzqGkogZqsVtyvLcr4Io7PU+CASfLbyvTvVNv+Enc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsZmhkyty5luOYl4NDkwu5o82BgMIZDeJdMssR3YM9dwShRf7MLNh6X35zj1n3dLwKjQBHv8pf5Qf6CS2swcoB1/Pr4PFxJj1mq470TpBcomnqvXv0rAsiwTFdsjw5HmRgmQP/dIFy7UNiAtP9IJA/BMhY2Aayz57pVrvdm2B9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NQSopt2y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41a4f291f80so19568845e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713886913; x=1714491713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZikBdylglkN8bWBjnrEpahW+0kxCuVDLNcL4eHsNrZ8=;
        b=NQSopt2y/5/RK1+rczM6p+t/uKDIG7gwhdO/Ts1jIsqIVZbwjIFTeeF7o4KNSjudq+
         zHm9LnfYx4zboP0ESFXsEywMxmftfVcXdbwzoaJv5Ww2pQPl67ogJch6I8f99bSdqyuJ
         LJsfJsOSgW5WsLypBzkU5k4MjKfItrjUNJUhf/Y8gRBUqOby+oUC1BRtpNBCmrW/MkWq
         asFPMVswTIOQPxlElzzG5cGUpDsIUZiK24sR+LlMv4EJCuhFpsyCKtbU36yhrcrgmFl7
         F/4YVG4KgmXqmQh0vyUSqJ927zFYOrG54Zx4HsgS0liUpsHnWnGn/Ik5NcoJRdTHhcnf
         ud6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713886913; x=1714491713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZikBdylglkN8bWBjnrEpahW+0kxCuVDLNcL4eHsNrZ8=;
        b=tyJdj1yCb2fOdpPD1zldzyRyZGBh9ZJpn9UrVqhurgf+DO+YNZqrgOsqQ4KIQ8Bsoo
         oUn56ZbxpsoknpVXBgfDdpNBLr5P0flf2rbaCa0ZkxWukM3bSve+s3nq/mlurhUqcDTM
         s75P4pZSqRoLaUZ+Dbj2vYoMdzWKSC8LzjU2dpCSMiNLRC69NdZ+Qw9lswVeuYFs3PBX
         CJ3efFpAXqnweQQXSY+NMBQ8hpU0VR6X5J0SsLxJTWza+5H4QQiF4ZNIq1bn/5q6bKnq
         Zq+pZfYX1CnN9yA8R3yP8jvt5vzuM6eBEBXrsO2B0rMO+qoqadeLiTf0fxdhQ19bSPq6
         uHng==
X-Forwarded-Encrypted: i=1; AJvYcCXNKCIkUP61LhMXjo4W6qwCbqid6IMG4SBn21J71PZi9DmpTtojmhkCracMuZET4ylEFeEM3idV/yznRWXgw0IiiemmU9rCBAvPDZEwHVmC
X-Gm-Message-State: AOJu0YzEkZKUmA4sNQLtFyDwoYtiulgKH/b8LCPekb/ktOdH+zyZ1mhL
	WVlQUxsYgohp42KVWFL3PZ7COZ3rg6iIQaWLEvaMPyAAk2mDNuzdShflpNuoYOE=
X-Google-Smtp-Source: AGHT+IFxgKWYTQdFrX3VG4d1eGF6RGQaWSLjzXM57qu9fcpFkJ6JpJK2zYVCn7svqzO1SOa5kWdf9w==
X-Received: by 2002:a05:600c:1d26:b0:418:5e80:b7af with SMTP id l38-20020a05600c1d2600b004185e80b7afmr10107916wms.36.1713886912731;
        Tue, 23 Apr 2024 08:41:52 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e6-20020a05600c4e4600b0041ac34cf06fsm2266461wmq.42.2024.04.23.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 08:41:52 -0700 (PDT)
Date: Tue, 23 Apr 2024 18:41:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nick Child <nnac123@linux.ibm.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Markus Elfring <Markus.Elfring@web.de>,
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ibmvnic: Use -EBUSY in __ibmvnic_reset()
Message-ID: <ba5e5ccf-59fa-4c7f-b649-97c19b2008a0@moroto.mountain>
References: <4cff158d-b5ac-4dca-9fbb-626237c1eafe@web.de>
 <f493e39063ee52a3d263de27bfd240149d910a88.camel@redhat.com>
 <da19d324-3c66-4bb1-8fa2-dc26dbea622b@moroto.mountain>
 <7e3f43a3-98e0-40ed-8820-2f1eef8742ba@linux.ibm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e3f43a3-98e0-40ed-8820-2f1eef8742ba@linux.ibm.com>

On Tue, Apr 23, 2024 at 09:55:57AM -0500, Nick Child wrote:
> > You're right that it doesn't affect the behavior of the driver except
> > for the debug output when we do:
> > 
> > 	netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);
> > 
> > But the - was left off uninitentionally so I think we should apply it.
> > 
> > I have been trying to look for similar bugs where the - is left off.
> > It's a bit challenging because there places where we use positive
> > error codes deliberately.  But in this case a static checker could
> > easily detect the bug with a low false positive ratio by saying, "We're
> > mixing normal negative error codes with positive EBUSY".
> > 
> > regards,
> > dan carpenter
> 
> Hello, small clarification, this patch will not effect the debug print
> statement due to the break statement immediately following:
> 	while () {	
> 		if () {
> 			rc = -EBUSY;
> 			break;
> 		}
> 		netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);
> 	}
> Though this return code can be passed to adapter->reset_done_rc, which is
> only treated as a boolean.
> 
> So, the point of the patch not doing any behavioral differences is still
> true.

Ah yes.  You're right.

regards,
dan carpenter


