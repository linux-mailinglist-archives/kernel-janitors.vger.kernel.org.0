Return-Path: <kernel-janitors+bounces-5112-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE2795C8E1
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Aug 2024 11:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC4F6283809
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Aug 2024 09:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2A314A093;
	Fri, 23 Aug 2024 09:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nXTDR0Q/"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DB8140397
	for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404248; cv=none; b=LlQT93CWVl31WbAbqz6AXJyUN7XaE3tM4XrT8Xp1JDUQ+gfBeoMdpdgppN+hJlvALyjM/RWLW4M8jCtgUyhFFj2jT9PXLDx6ulEI2cMwlO7goqSbi5zS90/UcXid7XVkQ/Gy8/HDl6Kgdiz31Ko+pc56mh1B2Zm1CA8BsJZy+Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404248; c=relaxed/simple;
	bh=Jg5ia3aHONUUadtyXlIgwVR+JddSADOSM/MNOrpTPos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bc7jzR0Ea+TfHjpROs4r1duOkfItI9r6cx0Dj92HY9WTI8hgnGtfsnXUQdKRjrT2ik9aPNSeo+Bx27FtBEyHeGwRVh6vg5TkbEVuCLm36vi8jj4pr77ZbL52MmaBm9mV8ab8GtWKE2o48174ppEr+FCj17s8zOIZQYnC14ME910=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nXTDR0Q/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86883231b4so232371366b.3
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 02:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724404245; x=1725009045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6AhXsDMlvtQOFjb81q++WnGuzMYwKiixG4cCIOvamkc=;
        b=nXTDR0Q/zKG7a371r/C+Qox3UpjNVYReGEAUlEQ+v32xynpD+ysfyJG7JkwkdamYl/
         WmhE7SJppdQmw+AB4HDaObMKIYibeyKqS9Ga1VDXaD2Z0e5C2iGg1mg+ff6NEge1Rf9V
         rC6XBVYqqvKiwQ9TiHub19DcpVpB0gXRCycVj2Hg3soA0gyYT7Ltqt8jib65SwGGnUne
         KFvFR9S6gKUm2nCTmk173+3OFsnNFtbZ0RN4khUSqahmgjpmGZvgsVsdfEJcvLvrmnN5
         VdBs36Cqj57IRBqEldujJabIbRqBDzJyU11nyJD3dOvGA0bLeKurv6DxB8qcm/9FbRXm
         julA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724404245; x=1725009045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AhXsDMlvtQOFjb81q++WnGuzMYwKiixG4cCIOvamkc=;
        b=doUZ/B5FbUyvmbqD/E0pzztcv2PUTVwkI7b2ByoVX5iQA/BRBqzMYPGeJs18fBFrrZ
         Ax5K1+SzzJ4rjPuYZABPNE9U3Sa5cqkH55lnHmU4Pjg5zPVJ7Z6II1fM7nzyLpvv3chx
         37EmGoBgg33DK2PG11gRyCwHibg9t1UkSEXc8kMhab0KisqXl5qwcluG/XVZN41XYL3Q
         98W7JG8w5YnIDZDGnRcmdeoAZz2gGFLGJHzB7+1fvy4ItaFS5AMD5V4KxgXpEzfed2ul
         dGkH65c3W7BE6xQAvX1EkXzemq+VNov7iz9E/YGq0OxU0VKN1rZxPuUEtQwTocbwE90b
         bsIw==
X-Forwarded-Encrypted: i=1; AJvYcCWoOJple0DFOBM0IovEPrb09SgJapY1YBb9IbiBydE6eg8DJ5kimUqlGIEZq8XgvFT3ecBs1oUISWe6ulpBL/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxVPMUGIRB0miOH1QijWWP0Y7ln7YPIPSnDnbcQ6JhtrkPapAw
	smDklUNJEoiUVrGYK6drve2zWseLdiQO85SjkXq5CEiC6ZcPo56FMIBlnMvcUDk+Qoo4sGPgOsd
	S
X-Google-Smtp-Source: AGHT+IG6BzmUUMzpD/+Pr+Wo1DEsgeyuZhet4hGF2/3wMnlt4qwkqUwDqWOnA0zjSrMvDtOD42xikQ==
X-Received: by 2002:a17:906:6a14:b0:a86:6a26:fec7 with SMTP id a640c23a62f3a-a86a52c70ecmr110389066b.30.1724404244722;
        Fri, 23 Aug 2024 02:10:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2202fdsm232702266b.13.2024.08.23.02.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 02:10:44 -0700 (PDT)
Date: Fri, 23 Aug 2024 12:10:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] idpf: Slightly simplify memory management in
 idpf_add_del_mac_filters()
Message-ID: <c786a345-9ec4-4e41-8e69-506239db291c@stanley.mountain>
References: <fa4f19064be084d5e740e625dcf05805c0d71ad0.1724394169.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa4f19064be084d5e740e625dcf05805c0d71ad0.1724394169.git.christophe.jaillet@wanadoo.fr>

On Fri, Aug 23, 2024 at 08:23:29AM +0200, Christophe JAILLET wrote:
> In idpf_add_del_mac_filters(), filters are chunked up into multiple
> messages to avoid sending a control queue message buffer that is too large.
> 
> Each chunk has up to IDPF_NUM_FILTERS_PER_MSG entries. So except for the
> last iteration which can be smaller, space for exactly
> IDPF_NUM_FILTERS_PER_MSG entries is allocated.
> 
> There is no need to free and reallocate a smaller array just for the last
> iteration.
> 
> This slightly simplifies the code and avoid an (unlikely) memory allocation
> failure.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/net/ethernet/intel/idpf/idpf_virtchnl.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
> index 70986e12da28..b6f4b58e1094 100644
> --- a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
> +++ b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
> @@ -3669,12 +3669,15 @@ int idpf_add_del_mac_filters(struct idpf_vport *vport,
>  		entries_size = sizeof(struct virtchnl2_mac_addr) * num_entries;
>  		buf_size = struct_size(ma_list, mac_addr_list, num_entries);
>  
> -		if (!ma_list || num_entries != IDPF_NUM_FILTERS_PER_MSG) {
> -			kfree(ma_list);
> +		if (!ma_list) {
>  			ma_list = kzalloc(buf_size, GFP_ATOMIC);
>  			if (!ma_list)
>  				return -ENOMEM;
>  		} else {
> +			/* ma_list was allocated in the first iteration
> +			 * so IDPF_NUM_FILTERS_PER_MSG entries are
> +			 * available
> +			 */
>  			memset(ma_list, 0, buf_size);
>  		}

It would be even nicer to move the ma_list allocation outside the loop:

        buf_size = struct_size(ma_list, mac_addr_list, IDPF_NUM_FILTERS_PER_MSG);
        ma_list = kmalloc(buf_size, GFP_ATOMIC);

regards,
dan carpenter


