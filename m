Return-Path: <kernel-janitors+bounces-350-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC57F16A6
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 16:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 777371C2185F
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Nov 2023 15:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914551CA8B;
	Mon, 20 Nov 2023 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsDwszF9"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2A3D8
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 07:03:46 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40a5a444c3eso13997925e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 07:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700492625; x=1701097425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j2/DoAoTwRlTiAW4H0ru7cJtclV8pamlA+0Xn4dEDNA=;
        b=LsDwszF9yLw3F68sA6ArREgDAuvs4tCAFjtZxc+ISp1sgQBcDDxdv0cPlGV06EBfvm
         jFGhy709V5wpIJurB4pmH87MWmfGgoF1PLdENggzxAUxr6Oqdr5HSMUkfUFom5UOcB1a
         7KK1Bwuk63783HV4vWtKpDWDuyZAoZO2/wDufmaNZgGmgQrJRI2ttMbrM9Ck+QmVmb4i
         kNDKNIjHWp1Jt+o7QvPzKFbnqnNezvLu/v8LWRfYB2pF0oRRDMhxCkAEfbZL5aeH77Ze
         zZY2yd1U6RuHMRx/WhrScuKuqR/PT5VgVQs2RrBnhqjbX326b//4H+AysguJVAiHtaoL
         wbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700492625; x=1701097425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2/DoAoTwRlTiAW4H0ru7cJtclV8pamlA+0Xn4dEDNA=;
        b=Moc27QEsGFYndEEr7NgtgtJPwQtFX/Lh/RejiZkEF5QDgTcASaXPViUL7mD5qrt5ka
         /hzcL8JlZaYS+p7Czol2KwI1s4VEMZRXQxZlbPbsFuqiPwT7weCUNkZBQsSfh64pSqNe
         V8nQ9zFBnpf4DJ57ym1MmehtGEXr8XHhLuJXe038vwKwm7dT8kFHPGRPr7+pwt3rpn0+
         NM7BFjx7cfC75sjaPDXybOdWaEjq9j35skHs6ZPIaHHR2kSwWB3I9dxWv3+gG359aW/4
         3jWzPAn+LtVCA7NfDZWYRYOmkbCRWj42jUqfQ8/36uy0xmcCqejYqL4RgNnrb4CRp085
         4PGQ==
X-Gm-Message-State: AOJu0YyUcQwNrC6Inm00izOMy6XiI8HBRXnm2f2OCGcfMb2RFNv9Gqp9
	BNeHSTaDytReJl+tpl3NQ0a9dQ==
X-Google-Smtp-Source: AGHT+IEkROT2Zc5Hlz2XunqbDmD4go7yi0hmtqMvT3a8XjwaqPTovpYGT0//l0lNIYQkihxLKReEsw==
X-Received: by 2002:a05:600c:4f8a:b0:40a:5c71:2c3e with SMTP id n10-20020a05600c4f8a00b0040a5c712c3emr6350067wmq.19.1700492624536;
        Mon, 20 Nov 2023 07:03:44 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c1d0400b004067e905f44sm13831459wms.9.2023.11.20.07.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:03:44 -0800 (PST)
Date: Mon, 20 Nov 2023 10:03:41 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: tomas.winkler@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	alexander.usyskin@intel.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] misc: mei: client.c: fix some error code problem in
 mei_cl_write
Message-ID: <92972476-0b1f-4d0a-9951-af3fc8bc6e65@suswa.mountain>
References: <20231120085343.157381-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120085343.157381-1-suhui@nfschina.com>

On Mon, Nov 20, 2023 at 04:53:45PM +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'rets' is never
> read. Remove some useless code, and let 'buf_len = -EOVERFLOW' to make
> sure we can return '-EOVERFLOW'.
> 
> mei_msg_hdr_init() return negative error code, rets should be
> 'PTR_ERR(mei_hdr)' rather than '-PTR_ERR(mei_hdr)'.
> 
> Fixes: 0cd7c01a60f8 ("mei: add support for mei extended header.")
> Fixes: 8c8d964ce90f ("mei: move hbuf_depth from the mei device to the hw modules")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/misc/mei/client.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> index 9c8fc87938a7..00dac0a47da0 100644
> --- a/drivers/misc/mei/client.c
> +++ b/drivers/misc/mei/client.c
> @@ -2011,7 +2011,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
>  
>  	mei_hdr = mei_msg_hdr_init(cb);
>  	if (IS_ERR(mei_hdr)) {
> -		rets = -PTR_ERR(mei_hdr);
> +		rets = PTR_ERR(mei_hdr);

KTODO: write a static checker rule which complains -PTR_ERR()

This might be complicated because there are parts of networking where
we store error codes as positive values.  But there is enough context in
this function to create some sort of warning about this code.  "Mixing
positive and negative error codes" perhaps?

$ git grep -n '\-PTR_ERR'
block/partitions/core.c:574:                   disk->disk_name, p, -PTR_ERR(part));
drivers/infiniband/ulp/ipoib/ipoib_multicast.c:291:                        -PTR_ERR(ah));
drivers/misc/mei/client.c:2014:         rets = -PTR_ERR(mei_hdr);
drivers/net/ethernet/intel/igb/igb_main.c:8963:                 unsigned int xdp_res = -PTR_ERR(skb);
drivers/net/ethernet/intel/igc/igc_main.c:2639:                 unsigned int xdp_res = -PTR_ERR(skb);
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2348:                     unsigned int xdp_res = -PTR_ERR(skb);
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5431:                         unsigned int xdp_res = -PTR_ERR(skb);
drivers/phy/sunplus/phy-sunplus-usb2.c:278:             ret = -PTR_ERR(phy);
drivers/scsi/libfc/fc_elsct.c:86:               switch (-PTR_ERR(fp)) {
drivers/scsi/libfc/fc_lport.c:1081:                  IS_ERR(fp) ? -PTR_ERR(fp) : 0, fc_lport_state(lport),
fs/ext4/indirect.c:1042:                                ext4_error_inode_block(inode, nr, -PTR_ERR(bh),
fs/jffs2/background.c:48:                       -PTR_ERR(tsk));
fs/ntfs/dir.c:92:                               -PTR_ERR(m));
fs/ntfs/dir.c:312:                              -PTR_ERR(page));
fs/ntfs/dir.c:643:                              -PTR_ERR(m));
fs/ntfs/dir.c:790:                              -PTR_ERR(page));
fs/ntfs/index.c:141:                            -PTR_ERR(m));
fs/ntfs/index.c:268:                            -PTR_ERR(page));
fs/ntfs/mft.c:162:      ntfs_error(ni->vol->sb, "Failed with error code %lu.", -PTR_ERR(m));
fs/ntfs/mft.c:289:                              "mft record, error code %ld.", -PTR_ERR(m));
net/ipv6/af_inet6.c:852:                        WRITE_ONCE(sk->sk_err_soft, -PTR_ERR(dst));
net/ipv6/inet6_connection_sock.c:123:           WRITE_ONCE(sk->sk_err_soft, -PTR_ERR(dst));
tools/lib/bpf/libbpf.c:10044:           errno = -PTR_ERR(ptr);
tools/lib/bpf/libbpf_internal.h:520:            errno = -PTR_ERR(ret);
tools/testing/selftests/bpf/prog_tests/btf_dump.c:59:           err = -PTR_ERR(btf);
tools/testing/selftests/bpf/prog_tests/sk_lookup.c:483:         errno = -PTR_ERR(link);

Quite a few of those were in printks and it might be an opportunity to
use %pe to print the ENOMEM etc strings instead of the number.

regards,
dan carpenter


