Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEE51C6D02
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 May 2020 11:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgEFJfg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 6 May 2020 05:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728640AbgEFJff (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 May 2020 05:35:35 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7462CC061A0F
        for <kernel-janitors@vger.kernel.org>; Wed,  6 May 2020 02:35:35 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j5so1368205wrq.2
        for <kernel-janitors@vger.kernel.org>; Wed, 06 May 2020 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hCCpyyCsOwf45inMt3o257A10/7eYZVNmL7O126puyY=;
        b=qQmDygjweLPcARZKtEeUbSr/HBXsPReN+4F8YbS6vvDa0tGq1EHXWrXA75PwpaRdjY
         mXiK+Z9ZeDkNeevpk4kqT3qKXBtxVsqTd0+msRTI9uCUkUr51sm73HUAZVDRr7C6OHBY
         vdEovuXdY87GlYoUTYozZ5pLMPDzr1vD4JSeHk8GGhmi9SWbc61tM5SHbcQPYjMeB1Bf
         9A6HoSI1Ck8eLfK6x8dOfo/L8/KpJJw3ITP42d6xcQyVuM46JE5qGEKHxJeGScrEg9by
         mk9TRYdKUIwdHujQ2wm11KE5z73mZ2TaE1PTlkPj3X+H+EG513sFepobGLXfwUyqe9BL
         zF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hCCpyyCsOwf45inMt3o257A10/7eYZVNmL7O126puyY=;
        b=FJTT0oFRJD4kstPnEEW+QvhJ4cKYD1KVq1muhUae1g7KHd0rGpM/HClVTK93FkFEdH
         v+8qwT4eXXQTQj8Zi4YENwDQrcipm1EUzmfkDiTTvma+6a3jLxH7I48pRx2+1RuvihOU
         e3QnzQS++3w3fb0PtOZBdrnYr9RQh0dkwYY9TwTz0H/LKt/df+/DJ4oUZ/vE/oA+7z86
         XM/zeizGo3fLfmHAlDihmjRezBkVPPG51joBZn27t9HPu4/ksFWJlQheyMOc/kw+W+yr
         U59/jL5AKHRZPupyAYHi/TpcesCUu8qKKQwyIVvEqT1Cgm1y1cLtlk8OJwlvq0uCLV/J
         UDjg==
X-Gm-Message-State: AGi0PuYIzzqDhTpNY+hAst/kp+EXC/4w+2l87TASn7eV3hnRhwMmQ3Gl
        EXHWCSOS/sG/jRscA/39JANb9QaCJYvc1g==
X-Google-Smtp-Source: APiQypLQJjy5vw34J6eJsUP2ihdRbCpbrZFEgYI/5478WTJrZUym62sqJpQzFvaN9hsw6iitUy55kA==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr8373863wrt.163.1588757734052;
        Wed, 06 May 2020 02:35:34 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
        by smtp.gmail.com with ESMTPSA id x7sm1677336wmi.17.2020.05.06.02.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 02:35:33 -0700 (PDT)
Date:   Wed, 6 May 2020 11:35:24 +0200
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        virtualization@lists.linux-foundation.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        eugene.volanschi@inria.fr
Subject: Re: [PATCH] iommu/virtio: reverse arguments to list_add
Message-ID: <20200506093524.GA497896@myrica>
References: <1588704467-13431-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588704467-13431-1-git-send-email-Julia.Lawall@inria.fr>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 05, 2020 at 08:47:47PM +0200, Julia Lawall wrote:
> Elsewhere in the file, there is a list_for_each_entry with
> &vdev->resv_regions as the second argument, suggesting that
> &vdev->resv_regions is the list head.  So exchange the
> arguments on the list_add call to put the list head in the
> second argument.
> 
> Fixes: 2a5a31487445 ("iommu/virtio: Add probe request")
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Thanks for the fix. The reason this hasn't blown up so far is
iommu_alloc_resv_region() initializes region->list, but adding more than
one item would break the list.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/virtio-iommu.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index d5cac4f46ca5..4e1d11af23c8 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -453,7 +453,7 @@ static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
>  	if (!region)
>  		return -ENOMEM;
>  
> -	list_add(&vdev->resv_regions, &region->list);
> +	list_add(&region->list, &vdev->resv_regions);
>  	return 0;
>  }
>  
> 
