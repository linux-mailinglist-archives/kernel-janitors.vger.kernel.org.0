Return-Path: <kernel-janitors+bounces-6851-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFE2A11065
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jan 2025 19:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D31E166EB7
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jan 2025 18:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AC81FC7FD;
	Tue, 14 Jan 2025 18:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJu9powr"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC961F9F52
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736880213; cv=none; b=DaH8RfGtpAzdq0zGMcqSVQZJEQlArZ+C3++hPWITZ4RE/HEjxKbPZBcETae11eoCWAJ1nMtDZd5C9hpb8dvWiYj4pejHXnc+iuQczvA76q2zg8kh7+te+vK6rG1qmBz/yuY1gQ2Wb7PWuBqTJk2HD27HApsMAskThnZBNVjFFh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736880213; c=relaxed/simple;
	bh=wJZZ0cwCSEQ2mts2sXIW9goT38hLDXXYRIJC7LGOT38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqMqT1abMGFGFB5FVU+nY6b0foy5t6yVBA52jIdEs/ShYXu9ZNrNOhsSOHPkBDa9bE8Zk70Wedhu3PUGF+1aGJln3ISuw9zYZBum1ZPvoWmM9fDzS64eFDQ+dJQaOdd401AXlr66zEFd32vUSSxbWMo9N++ENBESK1bvumrWdUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJu9powr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43690d4605dso41064625e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 10:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736880210; x=1737485010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kbd7D0Czmr9vCgKgM6FC/ck4MWSPttymXy3sW5wVy50=;
        b=VJu9powrlR0T/nEAPd2znsnI3aPcD7EA/PSxh1ZdR7j+pyjmufd1i8KvgjREa0OF9K
         Io1gl7B0z3DyBpiBS8J/B/HqtPdkg1I/qzz6ggvYzdVgqI1wTU+u8tTYkDJhfuDcZIR+
         2HOJnZWSHVBroLVyyYtY5HLgVBh+BhucWkcuHTACJLulCTtrtRmFIfLVk7cC4pNP6tck
         tUBzWkCRqdcrlxlCg99mFmTbxw0DXu7dda7qpcvBExNn1RAYe3V1tXfFdN9s9naQYZw2
         eRwoDiKCfEIL/nvvaHyzhjXd2rB8Smz8DbFU/JQEz5S3tkqEQlwKaArvjAOTyfbCWY3J
         bV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736880210; x=1737485010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kbd7D0Czmr9vCgKgM6FC/ck4MWSPttymXy3sW5wVy50=;
        b=sz4aumJ82v988tjNs1NwsAn/V4D6DfXW9zGQJ86F8Up6zlQ9K9EUJMt7Wdz4CqNI3H
         qLJaMhklXILl4JycP2eyB2hzt/sF45whXPGGfxa6bUOf5BZV13quwEP8Y8geeyqCMeNF
         jm7XrE36sqRlNRt+s3f8dykCXAS5HiMdtaVCQGV5gvCeymrqKjKVj/LS/DxkHuUGixWg
         qRdRKud7zg1vfvDygusJVvzUMAOn0dKWOD61KbcNPr2r5cFCUwvB9HKWZOX8MLCCErS8
         kgoCcdkKNVPgzY8YJHOkwLbWbOr2FCcJcS7fwhtm0m9sLSni0qrk00GHoPfmMs+qYWQ/
         WOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtgSGmnWJr1G3EjUXV3SN+IxXVRSTm1chODoBVmmPWXpT4IuLAUnZSHd0cLINgOkZVb5d+Gn9WGIIa9KYMhzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsQY3Zx5I98uTiBAnAN5r+C7281jXuT8SlbHIHHghoGTMx8ksp
	xs9U0O8ML3CxGrfx4BERFRsq47enpU3nm1HqwwcC8qsmCphhdg79x6JhF6FMRbA=
X-Gm-Gg: ASbGncuPIPG39CWKg3Hs8wo/MafC4Od676K+9RfhdntN8Xru8E+s805fgbYm/rg5bYN
	7ahgMQZSRHIAfu1Hw3bQs0gWtCfS6b7z+zJJ3YJ/hFTKTY2QW/ymFtMpokZX34jcEoxm8LDMqyu
	BK4X1wWpdXwRmWqL4sFh5mY7IV05Jw+lBwVArWJC9wrmCtBoJ+QlnePITTAkvHi7PqF15WRk4gG
	SMpanGs4pgGpgv7j6RaXG9jxs+GIS5qxCjEyRqwWQjPUjPzFqFpgwUlhhJfKQ==
X-Google-Smtp-Source: AGHT+IGD+NGu7We6kljAPJX0zi3pW7lKGhqM/7LhyfHIle3wv3K3ReYl5kCmvw+JLRJYw4gVRDI+zA==
X-Received: by 2002:a05:600c:1c28:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-436e2699dfbmr266852295e9.14.1736880210230;
        Tue, 14 Jan 2025 10:43:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e62133sm183786065e9.33.2025.01.14.10.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:43:29 -0800 (PST)
Date: Tue, 14 Jan 2025 21:43:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Louis Peens <louis.peens@corigine.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Quentin Monnet <qmo@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] nfp: bpf: prevent integer overflow in
 nfp_bpf_event_output()
Message-ID: <487897df-7a82-4c36-8dcf-13d1704f479d@stanley.mountain>
References: <6074805b-e78d-4b8a-bf05-e929b5377c28@stanley.mountain>
 <1ba87a40-5851-4877-a539-e065c3a8a433@intel.com>
 <Z4ZAMCRQW8iiYXAb@stanley.mountain>
 <ae4d008f-8a70-4c0d-a5c8-c480cad53cf5@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae4d008f-8a70-4c0d-a5c8-c480cad53cf5@intel.com>

On Tue, Jan 14, 2025 at 06:17:22PM +0100, Alexander Lobakin wrote:
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Date: Tue, 14 Jan 2025 13:45:04 +0300
> 
> > [ I tried to send this email yesterday but apparently gmail blocked
> >   it for security reasons?  So weird. - dan ]
> > 
> > On Mon, Jan 13, 2025 at 01:32:11PM +0100, Alexander Lobakin wrote:
> >> From: Dan Carpenter <dan.carpenter@linaro.org>
> >> Date: Mon, 13 Jan 2025 09:18:39 +0300
> >>
> >>> The "sizeof(struct cmsg_bpf_event) + pkt_size + data_size" math could
> >>> potentially have an integer wrapping bug on 32bit systems.  Check for
> >>
> >> Not in practice I suppose? Do we need to fix "never" bugs?
> >>
> > 
> > No, this is from static analysis.  We don't need to fix never bugs.
> > 
> > This is called from nfp_bpf_ctrl_msg_rx() and nfp_bpf_ctrl_msg_rx_raw()
> > and I assumed that since pkt_size and data_size come from skb->data on
> > the rx path then they couldn't be trusted.
> 
> skbs are always valid and skb->len could never cross INT_MAX to provoke
> an overflow.
> 

True but unrelated.  I think you are looking at the wrong code...

drivers/net/ethernet/netronome/nfp/bpf/offload.c
   445  int nfp_bpf_event_output(struct nfp_app_bpf *bpf, const void *data,
                                                                      ^^^^
This code comes from the network so it cannot be trusted.

   446                           unsigned int len)
   447  {
   448          struct cmsg_bpf_event *cbe = (void *)data;
                                       ^^^^^^^^^^^^^^^^^^^
It is cast to a struct here.

   449          struct nfp_bpf_neutral_map *record;
   450          u32 pkt_size, data_size, map_id;
   451          u64 map_id_full;
   452  
   453          if (len < sizeof(struct cmsg_bpf_event))
   454                  return -EINVAL;
   455  
   456          pkt_size = be32_to_cpu(cbe->pkt_size);
   457          data_size = be32_to_cpu(cbe->data_size);

pkt_size and data_size are u32 values which are controlled from
over the network.

   458          map_id_full = be64_to_cpu(cbe->map_ptr);
   459          map_id = map_id_full;
   460  
   461          if (len < sizeof(struct cmsg_bpf_event) + pkt_size + data_size)
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
On a 32bit system, then this math can overflow.  The pkt_size and
data_size are too high and we should return -EINVAL but this check
doesn't work because of integer wrapping.

   462                  return -EINVAL;
   63          if (cbe->hdr.ver != NFP_CCM_ABI_VERSION)
   464                  return -EINVAL;
   465  
   466          rcu_read_lock();
   467          record = rhashtable_lookup(&bpf->maps_neutral, &map_id,
   468                                     nfp_bpf_maps_neutral_params);
   469          if (!record || map_id_full > U32_MAX) {
   470                  rcu_read_unlock();
   471                  cmsg_warn(bpf, "perf event: map id %lld (0x%llx) not recognized, dropping event\n",
   472                            map_id_full, map_id_full);
   473                  return -EINVAL;
   474          }
   475  
   476          bpf_event_output(record->ptr, be32_to_cpu(cbe->cpu_id),
   477                           &cbe->data[round_up(pkt_size, 4)], data_size,
                                            ^^^^^^^^^^^^^^^^^^^^^
Here we are way out of bounds with regards to the cbe->data[] array.

regards,
dan carpenter

   478                           cbe->data, pkt_size, nfp_bpf_perf_event_copy);
   479          rcu_read_unlock();
   480  
   481          return 0;
   482  }


