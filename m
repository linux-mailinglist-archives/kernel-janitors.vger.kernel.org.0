Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54CF8C0D6C
	for <lists+kernel-janitors@lfdr.de>; Fri, 27 Sep 2019 23:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbfI0Vmt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 27 Sep 2019 17:42:49 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40265 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfI0Vmt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Sep 2019 17:42:49 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so2272756pfb.7
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Sep 2019 14:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=Lzcnw0iAcIFwZNCYEwiqETTo7mFYOXKonShWkT8groo=;
        b=sGZfP/z9N7kBYff/yn481rZ/m6Z9TK6lqaAfFkUlClJYaX8LJPJD0042nr+RR3kNgl
         L8pFTcb0BAOChMz1+gAVJoDsfySeQo0Fnr0M1vXJFjjh8Z5W4DCICoF+7zkY5cJm0Nyf
         y+AnIpfEzF2ChKoi9ajpC/gQP/wGShzwwUhQIKwQoa/Hqimb6p5zQDZpSzHQEm7kOvJ8
         9mkCLMkFNfZzwHE5YXzSjvy/ik4EG5Q3GDmViRu29WVrQApCyARAWK969W8a7bTabQi6
         WqByiOseyL9LLbeZy4lv7mAJKqWfhCX08Daalfg5JBz1TRuQaXpsIpIwuzozUVgYh01S
         +EfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Lzcnw0iAcIFwZNCYEwiqETTo7mFYOXKonShWkT8groo=;
        b=JoKMlroym7N61F0TvGh4yNeCGSNAJXw2NaEzhuOlhlkp8OEq+66NYmehK4HqfV2P0N
         auh2Vq4E2kY63mE3PWMziSCjHe3ZN28nWpaLMtRzgZ2mjnxmDmbLe1qLZq1ccD1oeX1b
         S4H+oZOWqSpLTBiQ3AlzYwMN+7+xW11fiDNOjg1jBRwarc/Ca+h5D9CgWSxz/ewY8eQ9
         w4QU1M/vsJwhYxA5LozjZkfCVWvHKJTdjPY1gBNe5iDtlxJPvfrtT5wA78yoi+XWqD64
         VUX19jsaiMWBtMjorjxnJh36D9XdcLvhZdjtfRp2I57Ds9cPJhxw+t46bOugsBAbVD+8
         YmwA==
X-Gm-Message-State: APjAAAWyy4tf0AKZsGTgjMXLzcrWGaNwJV2uaPfbtPVU4ndB+3hNPapW
        ZWhtAuS5Ar16+B7yrX4mldYTrA==
X-Google-Smtp-Source: APXvYqylvxizWriFlZFI3My3E7wjF1M17Xv3jfridbykbRDhmf/+GPf8eTOyqqe9JtmyjBQw57nNfA==
X-Received: by 2002:a65:628a:: with SMTP id f10mr11289856pgv.155.1569620566828;
        Fri, 27 Sep 2019 14:42:46 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id y138sm4035112pfb.174.2019.09.27.14.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 14:42:46 -0700 (PDT)
Date:   Fri, 27 Sep 2019 14:42:42 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        netdev@vger.kernel.org, oss-drivers@netronome.com,
        Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen A McCamant <smccaman@umn.edu>,
        Colin Ian King <colin.king@canonical.com>,
        "David S. Miller" <davem@davemloft.net>,
        John Hurley <john.hurley@netronome.com>,
        Pablo Neira <pablo@netfilter.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] nfp: abm: fix memory leak in
 nfp_abm_u32_knode_replace
Message-ID: <20190927144242.7e0d8fde@cakuba.netronome.com>
In-Reply-To: <1cde6417-5942-598b-3670-c0a7227ffe25@web.de>
References: <20190927015157.20070-1-navid.emamdoost@gmail.com>
        <1cde6417-5942-598b-3670-c0a7227ffe25@web.de>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 27 Sep 2019 14:12:42 +0200, Markus Elfring wrote:
> > Updated other gotos to have correct errno returned, too.  
> 
> How do you think about to add a jump target here?
> 
> 
> > +++ b/drivers/net/ethernet/netronome/nfp/abm/cls.c
> > @@ -176,8 +176,10 @@ nfp_abm_u32_knode_replace(struct nfp_abm_link *alink,
> >  	u8 mask, val;
> >  	int err;
> >
> > -	if (!nfp_abm_u32_check_knode(alink->abm, knode, proto, extack))
> > +	if (!nfp_abm_u32_check_knode(alink->abm, knode, proto, extack)) {
> > +		err = -EOPNOTSUPP;
> >  		goto err_delete;
> > +	}
> >
> >  	tos_off = proto == htons(ETH_P_IP) ? 16 : 20;  
> 
> -		goto err_delete;
> +		goto e_opnotsupp;
> 
> 
> > @@ -221,7 +227,7 @@ nfp_abm_u32_knode_replace(struct nfp_abm_link *alink,
> >  
> 
> +e_opnotsupp:
> +	err = -EOPNOTSUPP;
> 
> >  err_delete:
> >  	nfp_abm_u32_knode_delete(alink, knode);
> > -	return -EOPNOTSUPP;
> > +	return err;
> >  }
> >
> >  static int nfp_abm_setup_tc_block_cb(enum tc_setup_type type,  
> 
> 
> Can such a change variant be a bit nicer?

Definitely not.

Looks good as is, thanks Navid!
