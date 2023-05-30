Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C72571675E
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 May 2023 17:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbjE3Po3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 30 May 2023 11:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjE3Po1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 11:44:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7524FFC;
        Tue, 30 May 2023 08:44:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A56660A2A;
        Tue, 30 May 2023 15:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEEFC433EF;
        Tue, 30 May 2023 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685461465;
        bh=xyq2ElHNMFprRp6fU6YdEmdxHF45a2d8aKPnmaC4NpE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Ua6Ym9zyhup5L7v/DTEZ+Ak3SwWVrVqBVYo5kKEPXGbpul1uoG7x4yc3CHH3/P0LM
         rRcuikqbwHasZyd99QU4jgbbfmZC4pLZeVweJ4qdwaNVz0+zxGr8ZKt7fJDy1Gwyl3
         lmIHThM4utbYLiLMUW9Z3cvOIp06UXTrhyeOOp866fzvv1H0LVIhGEoQOuT/9kHBuI
         YKcJHloQxVMmJP/jdpUXR112zFseDrlgcrqOyxtaEDvW3Su2Yjp84I5VPabZP7g/fe
         qS2vfko8PLx72onhCd1JMwidj5Cu6kSQmgmDyQJGi5OonuT0uBCTcY57PzzZyQ9j5h
         ZFShzUk0lEXzQ==
Message-ID: <848c64cb6c6cf88fbbcf61624810c060f858a217.camel@kernel.org>
Subject: Re: [PATCH] nfsd: fix double fget() bug in __write_ports_addfd()
From:   Jeff Layton <jlayton@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Stanislav Kinsbursky <skinsbursky@parallels.com>
Cc:     Chuck Lever <chuck.lever@oracle.com>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        "J. Bruce Fields" <bfields@redhat.com>, linux-nfs@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Tue, 30 May 2023 11:44:23 -0400
In-Reply-To: <9c90e813-c7fb-4c90-b52b-131481640a78@kili.mountain>
References: <9c90e813-c7fb-4c90-b52b-131481640a78@kili.mountain>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 2023-05-29 at 14:35 +0300, Dan Carpenter wrote:
> The bug here is that you cannot rely on getting the same socket
> from multiple calls to fget() because userspace can influence
> that.  This is a kind of double fetch bug.
>=20

Nice catch.

> The fix is to delete the svc_alien_sock() function and insted do
> the checking inside the svc_addsock() function.
>=20
> Fixes: 3064639423c4 ("nfsd: check passed socket's net matches NFSd superb=
lock's one")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Based on static analysis and untested.  This goes through the NFS tree.=
=20
> Inspired by CVE-2023-1838.
>=20
>  include/linux/sunrpc/svcsock.h |  7 +++----
>  fs/nfsd/nfsctl.c               |  7 +------
>  net/sunrpc/svcsock.c           | 23 +++++------------------
>  3 files changed, 9 insertions(+), 28 deletions(-)
>=20
> diff --git a/include/linux/sunrpc/svcsock.h b/include/linux/sunrpc/svcsoc=
k.h
> index d16ae621782c..a7116048a4d4 100644
> --- a/include/linux/sunrpc/svcsock.h
> +++ b/include/linux/sunrpc/svcsock.h
> @@ -61,10 +61,9 @@ int		svc_recv(struct svc_rqst *, long);
>  void		svc_send(struct svc_rqst *rqstp);
>  void		svc_drop(struct svc_rqst *);
>  void		svc_sock_update_bufs(struct svc_serv *serv);
> -bool		svc_alien_sock(struct net *net, int fd);
> -int		svc_addsock(struct svc_serv *serv, const int fd,
> -					char *name_return, const size_t len,
> -					const struct cred *cred);
> +int		svc_addsock(struct svc_serv *serv, struct net *net,
> +			    const int fd, char *name_return, const size_t len,
> +			    const struct cred *cred);
>  void		svc_init_xprt_sock(void);
>  void		svc_cleanup_xprt_sock(void);
>  struct svc_xprt *svc_sock_create(struct svc_serv *serv, int prot);
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index e0e98b40a6e5..1489e0b703b4 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -698,16 +698,11 @@ static ssize_t __write_ports_addfd(char *buf, struc=
t net *net, const struct cred
>  		return -EINVAL;
>  	trace_nfsd_ctl_ports_addfd(net, fd);
> =20
> -	if (svc_alien_sock(net, fd)) {
> -		printk(KERN_ERR "%s: socket net is different to NFSd's one\n", __func_=
_);
> -		return -EINVAL;
> -	}
> -
>  	err =3D nfsd_create_serv(net);
>  	if (err !=3D 0)
>  		return err;
> =20
> -	err =3D svc_addsock(nn->nfsd_serv, fd, buf, SIMPLE_TRANSACTION_LIMIT, c=
red);
> +	err =3D svc_addsock(nn->nfsd_serv, net, fd, buf, SIMPLE_TRANSACTION_LIM=
IT, cred);
> =20
>  	if (err >=3D 0 &&
>  	    !nn->nfsd_serv->sv_nrthreads && !xchg(&nn->keep_active, 1))
> diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
> index 46845cb6465d..e4184e40793c 100644
> --- a/net/sunrpc/svcsock.c
> +++ b/net/sunrpc/svcsock.c
> @@ -1474,22 +1474,6 @@ static struct svc_sock *svc_setup_socket(struct sv=
c_serv *serv,
>  	return svsk;
>  }
> =20
> -bool svc_alien_sock(struct net *net, int fd)
> -{
> -	int err;
> -	struct socket *sock =3D sockfd_lookup(fd, &err);
> -	bool ret =3D false;
> -
> -	if (!sock)
> -		goto out;
> -	if (sock_net(sock->sk) !=3D net)
> -		ret =3D true;
> -	sockfd_put(sock);
> -out:
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(svc_alien_sock);
> -
>  /**
>   * svc_addsock - add a listener socket to an RPC service
>   * @serv: pointer to RPC service to which to add a new listener
> @@ -1502,8 +1486,8 @@ EXPORT_SYMBOL_GPL(svc_alien_sock);
>   * Name is terminated with '\n'.  On error, returns a negative errno
>   * value.
>   */
> -int svc_addsock(struct svc_serv *serv, const int fd, char *name_return,
> -		const size_t len, const struct cred *cred)
> +int svc_addsock(struct svc_serv *serv, struct net *net, const int fd,
> +		char *name_return, const size_t len, const struct cred *cred)
>  {
>  	int err =3D 0;
>  	struct socket *so =3D sockfd_lookup(fd, &err);
> @@ -1514,6 +1498,9 @@ int svc_addsock(struct svc_serv *serv, const int fd=
, char *name_return,
> =20
>  	if (!so)
>  		return err;
> +	err =3D -EINVAL;
> +	if (sock_net(so->sk) !=3D net)
> +		goto out;
>  	err =3D -EAFNOSUPPORT;
>  	if ((so->sk->sk_family !=3D PF_INET) && (so->sk->sk_family !=3D PF_INET=
6))
>  		goto out;

Reviewed-by: Jeff Layton <jlayton@kernel.org>
