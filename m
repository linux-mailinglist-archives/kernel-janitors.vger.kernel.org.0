Return-Path: <kernel-janitors+bounces-145-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD17DFFF3
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Nov 2023 10:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 065521C20FE9
	for <lists+kernel-janitors@lfdr.de>; Fri,  3 Nov 2023 09:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1964610A1D;
	Fri,  3 Nov 2023 09:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2370B79D1;
	Fri,  3 Nov 2023 09:18:23 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58170DE;
	Fri,  3 Nov 2023 02:18:21 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1qyqJV-0004lH-Ne; Fri, 03 Nov 2023 10:18:01 +0100
Date: Fri, 3 Nov 2023 10:18:01 +0100
From: Florian Westphal <fw@strlen.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Florian Westphal <fw@strlen.de>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] netfilter: nf_tables: fix pointer math issue in
 nft_byteorder_eval()
Message-ID: <20231103091801.GA8035@breakpoint.cc>
References: <15fdceb5-2de5-4453-98b3-cfa9d486e8da@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15fdceb5-2de5-4453-98b3-cfa9d486e8da@moroto.mountain>
User-Agent: Mutt/1.10.1 (2018-07-13)

Dan Carpenter <dan.carpenter@linaro.org> wrote:
> The problem is in nft_byteorder_eval() where we are iterating through a
> loop and writing to dst[0], dst[1], dst[2] and so on...  On each
> iteration we are writing 8 bytes.  But dst[] is an array of u32 so each
> element only has space for 4 bytes.  That means that every iteration
> overwrites part of the previous element.
> 
> I spotted this bug while reviewing commit caf3ef7468f7 ("netfilter:
> nf_tables: prevent OOB access in nft_byteorder_eval") which is a related
> issue.  I think that the reason we have not detected this bug in testing
> is that most of time we only write one element.

LGTM, thanks Dan.  We will route this via nf.git.

