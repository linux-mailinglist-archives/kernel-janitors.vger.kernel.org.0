Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2244A2B9
	for <lists+kernel-janitors@lfdr.de>; Tue, 18 Jun 2019 15:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbfFRNsY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 18 Jun 2019 09:48:24 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38354 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfFRNsY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jun 2019 09:48:24 -0400
Received: by mail-lf1-f67.google.com with SMTP id b11so9348164lfa.5
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2019 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iJmKAKxXNY/eDxKA8zSNselgrq1E+cvwinlMdmVZAj0=;
        b=cacfGXldfdERA2D7/w1ynW2VQsTn1b7qk3uj0WDFrM0xboK5HuBE6GGyV+UDRf8kby
         isgNXremPdDITxn9XQ/vhZh9Qv43SxXMctARDoJqV+BLdixewV8O+zlRT3BSODYIZ6DE
         nd86ZP5rZkLGJ2m9+2yJZJ0SeZpVE61F9L1k1NTHBbeIrCnyg9Y4z9TxD3ZWoAzY0Q4o
         uwRB2fzVH7UoX7H8L8iiEJPEtnDJk8VfvwHd9Nz1FXFYGb76d4kEUOQ7hzuz3FAlOk2d
         y35hrhm6+qp063fseqIsJmWv1CEwQz0+XFX0WlSYV7eu2meM0FBw1PzTiHUUfNJRkHr+
         zVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iJmKAKxXNY/eDxKA8zSNselgrq1E+cvwinlMdmVZAj0=;
        b=n/iNGZ1N2kdxHjCrJje1JhBv0/4ZJNP5OI1TbTmdQjfmtUQWhKf9EWruOr/oD9m5pT
         4KcNmvvCwV9SFvJq0pEr92rPJm1+FzksB9JEdWK7K81fc1KxOJHXaDLuItXSnYGAf7Ui
         OYeSTTL8EO3TuiYp9UhC1bHspXj49r2c6kLSlKyJYZNZAXUtfardp+JN4uA4Dgomfkx8
         SOHfaIS8el2Uh0vRoiJD089NbPsvSQQ7OMKxmrWEsAyZtL9raAaQUnR1SyQo0gj/Xw92
         m8Lf7MWB1VmIR6IfVvDSDQgbL9tLvS18wf19WP5HP87xN1NgPrF6xVuz8IVyRJW3sqRQ
         5zgQ==
X-Gm-Message-State: APjAAAWMEGYDKeUy+34dUE9p30bdTDxj0Px6QbLlFvsTwYzqQB0E26aU
        eudQ2uoBB3CTBp1KR39PMFtp4A==
X-Google-Smtp-Source: APXvYqy5gTlGzzNc80V9pWkczYKQWK9Gi90EqAnxJCcIf/zlrnAT5z4Bdsksw3HQh5Y4IX5L/DHOZA==
X-Received: by 2002:ac2:495e:: with SMTP id o30mr59137674lfi.140.1560865701929;
        Tue, 18 Jun 2019 06:48:21 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id t21sm2211126lfl.17.2019.06.18.06.48.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 06:48:20 -0700 (PDT)
Date:   Tue, 18 Jun 2019 06:48:11 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     arm@kernel.org, Krzysztof Halasa <khalasa@piap.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soc: ixp4xx: npe: Fix an IS_ERR() vs NULL check in probe
Message-ID: <20190618134811.bfs5lxazaw66ubb7@localhost>
References: <CACRpkdaX66=g7dG7SFkgr5Dwmop-p4qe7ELkn0KERtqVvp0vNA@mail.gmail.com>
 <20190618115410.GE18776@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618115410.GE18776@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 18, 2019 at 02:54:10PM +0300, Dan Carpenter wrote:
> The devm_ioremap_resource() function doesn't return NULL, it returns
> error pointers.
> 
> Fixes: 0b458d7b10f8 ("soc: ixp4xx: npe: Pass addresses as resources")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thanks!


-Olof

