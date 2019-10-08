Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 333CFD0101
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Oct 2019 21:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbfJHTNV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 8 Oct 2019 15:13:21 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:45470 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfJHTNU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Oct 2019 15:13:20 -0400
Received: by mail-qt1-f193.google.com with SMTP id c21so26846856qtj.12
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Oct 2019 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=B9rf+VBuWjx1PPlnlyQtG5L/QPp7gUPZolyg4GuyibI=;
        b=LOXRHIcZeA6ePEYLSqol3MkRA+IsiTAYOlNbx58hWKKoEQD9iUJEttMhPRV+DkYrJk
         8fNZOXJxUvymRqrDYBLAcZbRqKDzhPncxFmN29JojvA/J7CKicUtq8537UO3cgclRY+7
         XYZfdLow19wUcwG1UarnuVql5wgbRYO9i5uie8nERCIJ7gsXrfHe/fmQHyCgrCy0Kha2
         yu3GCGW7hn81vC8O7h/hyLo17hevn6ehYVjhqi2Lk1FfMSTjX8OMw1D+Gc64RNuIMnm1
         AaZW9UqaFoah6rkyRNMS1x7tt720Z5ImScaUBTCKvS9TShc88MvcmcnQ1tq9U3GWLkxw
         UPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=B9rf+VBuWjx1PPlnlyQtG5L/QPp7gUPZolyg4GuyibI=;
        b=pQK26hrINuOxfbKW4pNuk7d2apru//lHvMkcuiJsFNQGOx9vDu9DMC/hchVAOBYvbP
         VTVOV5nDqJptyDfndML7c2CnaviGFw38D1yBLtKKkTMrClxNTtRwy2iW0RS1FauQtZV/
         JOMnnHdxcXeff4kar6+eY5cwJgcsGqXKKTrZs44v/48u5JY6BFokK4K7qlvC/LhalIuY
         VXHeriIF6LeVAggKBZAMuEfCEH0jnVf7UkCOG6OPS8gg1nmKi9goXljrvnZaxsv0Tpga
         /79Rb+31aCvnkE5vA0SSa3eB47y60zVS6eK3pX55y5JtRbR5vJN6mYKDi5sW0ATatjgJ
         AYtw==
X-Gm-Message-State: APjAAAVtyzDqR9JpDZ/6Ua/Vx/w3dQiYYmhc176KQ/CKGtNyx+Uv7e7+
        0iSveBn5iJXvDvroj9LV4V45xA==
X-Google-Smtp-Source: APXvYqxZYBoQmp2JX9+sjZaGwUNjG/XJ53dm/PlE8/teJVUjUIwQMnfn776A15fICR/1WALAiztJwQ==
X-Received: by 2002:a05:6214:2e4:: with SMTP id h4mr35227322qvu.127.1570561999863;
        Tue, 08 Oct 2019 12:13:19 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id z46sm12187717qth.62.2019.10.08.12.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 12:13:19 -0700 (PDT)
Date:   Tue, 8 Oct 2019 12:13:08 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Colin King <colin.king@canonical.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        oss-drivers@netronome.com, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nfp: bpf: make array exp_mask static, makes object
 smaller
Message-ID: <20191008121308.121c2748@cakuba.netronome.com>
In-Reply-To: <20191007115239.1742-1-colin.king@canonical.com>
References: <20191007115239.1742-1-colin.king@canonical.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon,  7 Oct 2019 12:52:39 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array exp_mask on the stack but instead make it
> static. Makes the object code smaller by 224 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   77832	   2290	      0	  80122	  138fa	ethernet/netronome/nfp/bpf/jit.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   77544	   2354	      0	  79898	  1381a	ethernet/netronome/nfp/bpf/jit.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
